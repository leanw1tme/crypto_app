import 'package:crypto_app/models/main_data.dart';
import 'package:flutter/material.dart';

import '../../models/data_model.dart';
import '../../repositories/crypto_repository.dart';
import 'coin_widget.dart';

class ListCoins extends StatefulWidget {
  const ListCoins({super.key});

  @override
  State<ListCoins> createState() => _ListCoinsState();
}

class _ListCoinsState extends State<ListCoins> {
  late Future<MainData> _futureCoins;
  late CryptoCoinsRepository repository;
  @override
  void initState() {
    repository = CryptoCoinsRepository();
    _futureCoins = repository.getCryptoCoins();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MainData>(
      future: _futureCoins,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            var coinsData = snapshot.data!.dataModel;
            return CoinWidget(coins: coinsData);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
        }

        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
