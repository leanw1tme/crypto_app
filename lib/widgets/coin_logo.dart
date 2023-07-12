import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/svg.dart';

import '../models/data_model.dart';

class CoinLogoWidget extends StatelessWidget {
  final DataModel coin;
  const CoinLogoWidget({
    Key? key,
    required this.coin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var coinIconUrl =
        "https://raw.githubusercontent.com/spothq/cryptocurrency-icons/master/128/color/";
    TextTheme textStyle = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.only(left: 16.0),
      height: 96.0,
      width: 96.0,
      //78 Remaining
      child: Column(
        children: [
          SizedBox(
              height: 50.0,
              width: 50.0,
              child: CachedNetworkImage(
                imageUrl: (("$coinIconUrl${coin.symbol}.png").toLowerCase()),
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) =>
                    SvgPicture.asset('assets/icons/dollar.svg'),
              )),
          const SizedBox(height: 4.0),
          Text(
            coin.symbol,
            style: textStyle.titleMedium,
          ),
          const SizedBox(height: 2.0),
          Text(
            "\$${coin.quoteModel.usdModel.price.toStringAsFixed(2)}",
            style: textStyle.titleSmall,
          ),
        ],
      ),
    );
  }
}
