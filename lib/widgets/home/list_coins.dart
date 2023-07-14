import 'dart:async';

import 'package:crypto_app/models/bloc/crypto_bloc.dart';
import 'package:crypto_app/models/data/main_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../repositories/crypto_repository.dart';
import 'coin_widget.dart';

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
    return RefreshIndicator(
      onRefresh: () async {
        _cryptoListBloc.add(LoadCryptoList());
      },
      child: BlocBuilder<CryptoBloc, CryptoState>(
        bloc: _cryptoListBloc,
        builder: (context, state) {
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
          if (state is CryptoLoadingFailure) {
            return Center(
                child: Column(children: [
              const Text(
                'Unforeseen malfunctions have occurred',
                style: TextStyle(fontSize: 20),
              ),
              TextButton(
                  onPressed: () {
                    _cryptoListBloc.add(LoadCryptoList());
                  },
                  child: const Text('Try again'))
            ]));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
