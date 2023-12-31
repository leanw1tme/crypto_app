import 'package:crypto_app/models/models.dart';
import 'package:crypto_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoinChartWidget extends StatefulWidget {
  const CoinChartWidget({
    Key? key,
    required this.coinPrice,
    required this.outputDate,
    required this.data,
    required this.coin,
  }) : super(key: key);

  final UsdModel coinPrice;
  final DataModel coin;
  final String outputDate;
  final List<ChartData> data;

  @override
  // ignore: library_private_types_in_public_api
  _CoinChartWidgetState createState() => _CoinChartWidgetState();
}

class _CoinChartWidgetState extends State<CoinChartWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500.h,
      child: Column(
        children: [
          SizedBox(
            height: 15.h,
          ),
          Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                  height: 100.h, child: CoinLogoWidget(coin: widget.coin))),
          Align(
            alignment: Alignment.topCenter,
            child: Text(
              widget.coin.name,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Text(
            '\$${widget.coinPrice.price.toStringAsFixed(2)}',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Text(
            widget.outputDate,
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 18.sp,
              color: Colors.grey,
            ),
          ),
          ChartWidget(
              coin: widget.coin,
              coinPrice: widget.coinPrice,
              data: widget.data),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  ParametrWidget(
                      parametr: 'CMC Rank', value: ' ${widget.coin.cmcRank}'),
                  SizedBox(
                    height: 25.h,
                  ),
                  ParametrWidget(
                      parametr: 'Total Supply',
                      value:
                          ' ${widget.coin.totalSupply.toString().substring(0, 6)}'),
                ],
              ),
              SizedBox(
                width: 60.w,
              ),
              Column(
                children: [
                  ParametrWidget(
                      parametr: 'Volume_24h',
                      value: ' ${widget.coinPrice.volume24h}'),
                  SizedBox(
                    height: 25.h,
                  ),
                  ParametrWidget(
                      parametr: 'Market Cap',
                      value:
                          ' ${widget.coinPrice.marketCap.toString().substring(0, 6)}'),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
