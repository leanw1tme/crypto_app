import 'package:crypto_app/models/models.dart';
import 'package:crypto_app/screens/screen.dart';
import 'package:crypto_app/theme/colors.dart';
import 'package:crypto_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoinCard extends StatelessWidget {
  const CoinCard({super.key, required this.coin, required this.price});
  final DataModel coin;
  final UsdModel price;

  @override
  Widget build(BuildContext context) {
    final color = CryptoColors.parse(coin.symbol);
    //Ограничение кол-во символов
    var limitedPrice = price.price.toString().substring(0, 8);
    return InkWell(
        onTap: () => Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => ModelScreen(
                coin: coin,
                price: price,
              ),
            ),
            (route) => true),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 15.w,
            ),
            SizedBox(
                width: 60.w, height: 40.h, child: CoinLogoWidget(coin: coin)),
            Text(
              coin.symbol,
              style: TextStyle(
                  fontSize: 23.sp, fontWeight: FontWeight.w500, color: color),
            ),
            Expanded(
              child: Text(
                limitedPrice,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.right,
              ),
            ),
            SizedBox(
              width: 20.w,
            ),
            Row(
              children: [
                Text(
                  "${price.percentChange_30d.toStringAsFixed(2)}%",
                  style: TextStyle(
                    //Цвет под значение
                    color: price.percentChange_30d >= 0
                        ? Colors.green
                        : Colors.red,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.right,
                ),
                Icon(
                    //Цвет и иконка под значение
                    price.percentChange_30d >= 0
                        ? Icons.arrow_drop_up
                        : Icons.arrow_drop_down,
                    color: price.percentChange_30d >= 0
                        ? Colors.green
                        : Colors.red)
              ],
            ),
            SizedBox(
              width: 10.w,
            )
          ],
        ));
  }
}
