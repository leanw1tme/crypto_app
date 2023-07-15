import 'package:crypto_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:crypto_app/models/models.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        padding: EdgeInsets.only(top: 15.h),
        separatorBuilder: (context, index) {
          return Column(
            children: [
              SizedBox(
                height: 5.h,
              ),
              const Divider(),
              SizedBox(height: 5.h),
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
