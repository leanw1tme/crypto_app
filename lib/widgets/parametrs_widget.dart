import 'package:flutter/material.dart';

//Виджет параметров для модели
class ParametrWidget extends StatelessWidget {
  const ParametrWidget(
      {super.key, required this.parametr, required this.value});
  final String parametr;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(
            parametr,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          Text(
            value,
            style: Theme.of(context).textTheme.displaySmall,
          )
        ],
      ),
    );
  }
}
