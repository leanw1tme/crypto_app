import 'package:crypto_app/widgets/home/coin_list_card.dart';
import 'package:flutter/material.dart';

import '../../models/data/data_model.dart';

class CoinWidget extends StatelessWidget {
  final List<DataModel> coins;
  const CoinWidget({
    Key? key,
    required this.coins,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemCount: 12,
        padding: const EdgeInsets.only(top: 15),
        separatorBuilder: (context, index) {
          return const Column(
            children: [
              SizedBox(
                height: 5,
              ),
              Divider(),
              SizedBox(height: 5),
            ],
          );
        },
        itemBuilder: (context, index) {
          var coin = coins[index];
          var coinPrice = coin.quoteModel.usdModel;
          return CoinCard(coin: coin, price: coinPrice);
        });
  }
}
