import 'package:crypto_app/models/data/data_model.dart';
import 'package:crypto_app/widgets/model/toggle_button.dart';
import 'package:crypto_app/widgets/parametrs_widget.dart';
import 'package:flutter/material.dart';

import '../../models/data/chart_data.dart';
import '../../models/data/usd_model.dart';
import '../coin_logo.dart';
import 'chart_widget.dart';

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
      height: 500,
      child: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                  height: 100, child: CoinLogoWidget(coin: widget.coin))),
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
              fontSize: 18,
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
                    height: 25,
                  ),
                  ParametrWidget(
                      parametr: 'Total Supply',
                      value:
                          ' ${widget.coin.totalSupply.toString().substring(0, 6)}'),
                ],
              ),
              SizedBox(
                width: 60,
              ),
              Column(
                children: [
                  ParametrWidget(
                      parametr: 'Volume_24h',
                      value: ' ${widget.coinPrice.volume24h}'),
                  SizedBox(
                    height: 25,
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
