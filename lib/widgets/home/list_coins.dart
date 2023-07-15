import 'package:crypto_app/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

import 'package:crypto_app/repositories/repositories.dart';
import 'package:crypto_app/widgets/widgets.dart';

class ListCoins extends StatefulWidget {
  const ListCoins({super.key});

  @override
  State<ListCoins> createState() => _ListCoinsState();
}

class _ListCoinsState extends State<ListCoins> {
  final _cryptoListBloc = CryptoBloc(GetIt.I<CryptoCoinsRepository>());

  @override
  void initState() {
    _cryptoListBloc.add(LoadCryptoList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //Внедрение pull-to-refresh для обновления значении криптовалют
    return RefreshIndicator(
      onRefresh: () async {
        _cryptoListBloc.add(LoadCryptoList());
      },
      child: BlocBuilder<CryptoBloc, CryptoState>(
        bloc: _cryptoListBloc,
        builder: (context, state) {
          //Успешно загружено
          if (state is CryptoLoaded) {
            return FutureBuilder<MainData>(
                future: state.coinsList,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      var coinsData = snapshot.data!.dataModel;
                      return CoinWidget(coins: coinsData);
                    }
                  }
                  return const Center(child: CircularProgressIndicator());
                });
          }
          //Ошибка загрузки
          if (state is CryptoLoadingFailure) {
            return Center(
                child: Column(children: [
              Text(
                'Произошла ошибка, попробуйте еще раз',
                style: TextStyle(fontSize: 20.sp),
              ),
              TextButton(
                  onPressed: () {
                    _cryptoListBloc.add(LoadCryptoList());
                  },
                  child: const Text('Обновить'))
            ]));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
