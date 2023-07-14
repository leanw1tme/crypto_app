import 'package:crypto_app/models/data/sparkline_data.dart';

import 'main_data.dart';

class Roi {
  double times;
  Currency currency;
  double percentage;

  Roi({
    required this.times,
    required this.currency,
    required this.percentage,
  });

  factory Roi.fromJson(Map<String, dynamic> json) => Roi(
        times: json["times"]?.toDouble(),
        currency: currencyValues.map[json["currency"]]!,
        percentage: json["percentage"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "times": times,
        "currency": currencyValues.reverse[currency],
        "percentage": percentage,
      };
}

enum Currency { BTC, USD, ETH }

final currencyValues =
    EnumValues({"btc": Currency.BTC, "eth": Currency.ETH, "usd": Currency.USD});
