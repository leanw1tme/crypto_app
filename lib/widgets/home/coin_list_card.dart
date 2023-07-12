import 'package:crypto_app/models/data_model.dart';
import 'package:crypto_app/models/main_data.dart';
import 'package:crypto_app/models/quote_model.dart';
import 'package:crypto_app/models/usd_model.dart';
import 'package:crypto_app/screens/model_screen.dart';
import 'package:crypto_app/widgets/coin_logo.dart';
import 'package:flutter/material.dart';

class CoinCard extends StatelessWidget {
  const CoinCard({super.key, required this.coin, required this.price});
  final DataModel coin;
  final UsdModel price;

  @override
  Widget build(BuildContext context) {
    //Ограничение кол-во символов
    var limitedPrice = price.price.toString().substring(0, 8);
    var limitedString = price.volume24h.toString().substring(0, 3);
    return InkWell(
      onTap: () => Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => ModelScreen(coin: coin),
          ),
          (route) => true),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 50,
            height: 50,
            child: CoinLogoWidget(coin: coin),
          ),
          SizedBox(
            width: 100,
            child: Text(
              coin.symbol,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          const SizedBox(
            width: 50,
          ),
          Expanded(
            child: Text(
              limitedPrice,
              style: Theme.of(context).textTheme.labelMedium,
              textAlign: TextAlign.right,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  "${price.percentChange_30d.toStringAsFixed(2)}%",
                  style: TextStyle(
                    color: price.percentChange_30d >= 0
                        ? Colors.green
                        : Colors.red,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.right,
                ),
                Text(
                  limitedString,
                  style: TextStyle(fontSize: 10, color: Colors.grey),
                )
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
