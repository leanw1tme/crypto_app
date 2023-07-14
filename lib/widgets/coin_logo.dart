import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/svg.dart';

import '../models/data/data_model.dart';

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

    return CachedNetworkImage(
      imageUrl: (("$coinIconUrl${coin.symbol}.png").toLowerCase()),
      errorWidget: (context, url, error) =>
          SvgPicture.asset('assets/img/dollar.svg'),
    );
  }
}
