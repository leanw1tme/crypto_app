import 'dart:math';

import 'package:crypto_app/models/data/usd_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../models/data/chart_data.dart';
import '../models/data/data_model.dart';
import '../theme/colors.dart';
import '../widgets/coin_logo.dart';
import '../widgets/model/coin_chart_widget.dart';

class ModelScreen extends StatefulWidget {
  const ModelScreen({super.key, required this.coin, required this.price});

  final DataModel coin;
  final UsdModel price;

  @override
  State<ModelScreen> createState() => _ModelScreenState();
}

class _ModelScreenState extends State<ModelScreen> {
  @override
  Widget build(BuildContext context) {
    final color = CryptoColors.parse(widget.coin.symbol);
    Random random = Random();
    int next(int min, int max) => random.nextInt(max - min);
    var coinPrice = widget.coin.quoteModel.usdModel;
    DateTime parseDate = new DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")
        .parse(coinPrice.lastUpdated);
    var inputDate = DateTime.parse(parseDate.toString());
    var outputFormat = DateFormat('MM/dd/yyyy hh:mm a');
    var outputDate = outputFormat.format(inputDate);
    var data = [
      ChartData(next(110, 140), 1),
      ChartData(next(9, 41), 2),
      ChartData(next(140, 200), 3),
      ChartData(coinPrice.percentChange_24h, 4),
      ChartData(coinPrice.percentChange_1h, 5),
      ChartData(next(110, 140), 6),
      ChartData(next(9, 41), 7),
      ChartData(next(140, 200), 8),
      ChartData(coinPrice.percentChange_24h, 9),
      ChartData(coinPrice.percentChange_1h, 10),
      ChartData(next(110, 140), 12),
      ChartData(next(9, 41), 13),
      ChartData(coinPrice.percentChange_1h, 14),
      ChartData(next(9, 41), 15),
      ChartData(next(140, 200), 16),
      ChartData(coinPrice.percentChange_24h, 17),
      ChartData(coinPrice.percentChange_1h, 18),
      ChartData(next(110, 140), 19),
      ChartData(next(9, 41), 20),
      ChartData(next(140, 200), 21),
      ChartData(coinPrice.percentChange_24h, 22),
      ChartData(next(110, 140), 23),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.coin.symbol),
        foregroundColor: Colors.white,
        backgroundColor: color,
      ),
      body: Column(
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
          Align(
            alignment: Alignment.topCenter,
            child: Text(
              '\$' + widget.price.price.toString().substring(0, 8),
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
          CoinChartWidget(
              coinPrice: coinPrice, outputDate: outputDate, data: data),
        ],
      ),
    );
  }
}
