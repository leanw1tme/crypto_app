import 'package:crypto_app/widgets/model/toggle_button.dart';
import 'package:flutter/material.dart';

import '../../models/data/chart_data.dart';
import '../../models/data/usd_model.dart';
import 'chart_widget.dart';

class CoinChartWidget extends StatefulWidget {
  const CoinChartWidget({
    Key? key,
    required this.coinPrice,
    required this.outputDate,
    required this.data,
  }) : super(key: key);

  final UsdModel coinPrice;
  final String outputDate;
  final List<ChartData> data;

  @override
  _CoinChartWidgetState createState() => _CoinChartWidgetState();
}

class _CoinChartWidgetState extends State<CoinChartWidget> {
  List<bool> _isSelected = [true, true, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: Column(
        children: [
          Text(
            '\$' + widget.coinPrice.price.toStringAsFixed(2),
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
              coinPrice: widget.coinPrice,
              color: Colors.green,
              data: widget.data),
          ToggleButtons(
            borderRadius: BorderRadius.circular(8.0),
            borderColor: Colors.indigoAccent,
            color: Colors.white,
            fillColor: Colors.green,
            selectedColor: Colors.white,
            selectedBorderColor: Colors.indigoAccent,
            children: [
              ToggleButtonWidget(name: "Today"),
              ToggleButtonWidget(name: "1W"),
              ToggleButtonWidget(name: "1M"),
              ToggleButtonWidget(name: "3M"),
              ToggleButtonWidget(name: "6M"),
            ],
            isSelected: _isSelected,
            onPressed: (int newIndex) {
              setState(() {
                _isSelected[newIndex] = true;
                for (int i = 0; i < _isSelected.length; i++) {
                  if (i != newIndex) {
                    _isSelected[i] = false;
                  }
                }
              });
            },
          ),
        ],
      ),
    );
  }
}
