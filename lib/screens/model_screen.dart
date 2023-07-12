import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/chart_data.dart';
import '../models/data_model.dart';
import '../widgets/model/coin_chart_widget.dart';

class ModelScreen extends StatelessWidget {
  const ModelScreen({super.key, required this.coin});

  final DataModel coin;

  @override
  Widget build(BuildContext context) {
    Random random = Random();
    int next(int min, int max) => random.nextInt(max - min);
    var coinPrice = coin.quoteModel.usdModel;
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
        title: Text(coin.symbol),
      ),
      body: CustomScrollView(
        slivers: [
          CoinChartWidget(
              coinPrice: coinPrice, outputDate: outputDate, data: data),
          SliverToBoxAdapter(
            child: Container(
              height: 600,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16.0),
                    height: 500.0,
                    width: double.infinity,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "Circulating Supply: ",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Text(
                              coin.circulatingSupply.toString(),
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ],
                        ),
                        const SizedBox(height: 8.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "Max Supply: ",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Text(
                              coin.maxSupply.toString(),
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ],
                        ),
                        const SizedBox(height: 8.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "Market pairs: ",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Text(
                              coin.numMarketPairs.toString(),
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ],
                        ),
                        const SizedBox(height: 8.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "Market Cap: ",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Text(
                              coin.quoteModel.usdModel.marketCap
                                  .toStringAsFixed(2),
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ],
                        ),
                        const SizedBox(height: 8.0),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
