import 'package:crypto_app/models/data/data_model.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../models/data/chart_data.dart';
import '../../models/data/usd_model.dart';
import '../../theme/colors.dart';

class ChartWidget extends StatelessWidget {
  const ChartWidget({
    Key? key,
    required this.data,
    required this.coinPrice,
    required this.coin,
  }) : super(key: key);

  final List<ChartData> data;
  final UsdModel coinPrice;
  final DataModel coin;
  @override
  Widget build(BuildContext context) {
    final color = CryptoColors.parse(coin.symbol);
    return Expanded(
      child: SizedBox(
        height: 50.0,
        width: double.infinity,
        child: SfCartesianChart(
          plotAreaBorderWidth: 0,
          primaryXAxis: CategoryAxis(isVisible: false),
          primaryYAxis: CategoryAxis(isVisible: false),
          legend: const Legend(isVisible: false),
          tooltipBehavior: TooltipBehavior(enable: false),
          series: <ChartSeries<ChartData, String>>[
            SplineAreaSeries<ChartData, String>(
                dataSource: data,
                xValueMapper: (ChartData sales, _) => sales.year.toString(),
                yValueMapper: (ChartData sales, _) => sales.value,
                gradient: LinearGradient(
                    colors: [color, Colors.white],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)),
          ],
        ),
      ),
    );
  }
}
