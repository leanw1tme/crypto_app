import 'dart:math';

import 'package:crypto_app/models/models.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../theme/colors.dart';
import 'package:crypto_app/widgets/widgets.dart';

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
    //Конвертировка данных даты под формат
    DateTime parseDate =
        DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(coinPrice.lastUpdated);
    var inputDate = DateTime.parse(parseDate.toString());
    var outputFormat = DateFormat('MM/dd/yyyy hh:mm a');
    var outputDate = outputFormat.format(inputDate);
    var data = [
      ChartData(next(110, 140), 1),
      ChartData(next(9, 41), 2),
      ChartData(next(140, 200), 3),
      ChartData(coinPrice.percentChange_24h, 4),
      ChartData(coinPrice.percentChange_1h, 5),
      ChartData(next(110, 180), 6),
      ChartData(next(9, 41), 7),
      ChartData(next(140, 200), 8),
      ChartData(coinPrice.percentChange_24h, 9),
      ChartData(coinPrice.percentChange_1h, 10),
      ChartData(next(110, 140), 12),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.coin.symbol),
        foregroundColor: Colors.white,
        backgroundColor: color,
      ),
      body: Column(
        children: [
          //Основной виджет модели
          CoinChartWidget(
              coin: widget.coin,
              coinPrice: coinPrice,
              outputDate: outputDate,
              data: data),
        ],
      ),
    );
  }
}
