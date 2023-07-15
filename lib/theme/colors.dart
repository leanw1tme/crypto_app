import 'dart:ui';

//Адаптированные цвета под криптовалюты
class AppColors {
  // Blues
  static Color marinerBlue = const Color(0xff296ecb);
}

class CryptoColors {
  static Color btc = const Color(0xfff7931b);
  static Color eth = const Color(0xff627eea);
  static Color ada = const Color(0xff656667);
  static Color usdt = const Color(0xff27a17b);
  static Color bnb = const Color(0xfff3ba2f);
  static Color xrp = const Color(0xff656667);
  static Color sol = const Color(0xff67f9a1);
  static Color dot = const Color(0xffe60e7a);
  static Color usdc = const Color(0xff3f73c4);
  static Color doge = const Color(0xffc3a634);
  static Color uni = const Color(0xffff0f7a);
  static Color link = const Color(0xff295ada);
  static Color ltc = const Color(0xffbfbbbb);
  static Color algo = const Color(0xff656667);
  static Color bch = const Color(0xff8dc351);
  static Color wbtc = const Color(0xff656667);
  static Color atom = const Color(0xff2e3148);
  static Color icp = const Color(0xff656667);
  static Color fil = const Color(0xff42c1ca);
  static Color matic = const Color(0xff6f41d8);
  static Color trx = const Color(0xffef0126);
  static Color xlm = const Color(0xff656667);
  static Color etc = const Color(0xff328332);
  static Color vet = const Color(0xff14bdff);
  static Color dai = const Color(0xfff4b731);
  static Color xtz = const Color(0xffa6e007);

  static final Map<String, Color> _map = {
    "btc": btc,
    "eth": eth,
    "ada": ada,
    "usdt": usdt,
    "bnb": bnb,
    "xrp": xrp,
    "sol": sol,
    "dot": dot,
    "usdc": usdc,
    "doge": doge,
    "uni": uni,
    "link": link,
    "ltc": ltc,
    "algo": algo,
    "bch": bch,
    "wbtc": wbtc,
    "atom": atom,
    "icp": icp,
    "fil": fil,
    "matic": matic,
    "trx": trx,
    "xlm": xlm,
    "etc": etc,
    "vet": vet,
    "dai": dai,
    "xtz": xtz,
  };

  static Color parse(String symbol) => _map.containsKey(symbol.toLowerCase())
      ? _map[symbol.toLowerCase()]!
      : AppColors.marinerBlue;
}
