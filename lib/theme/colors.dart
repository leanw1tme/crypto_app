import 'dart:ui';

class AppColors {
  // Blues
  static Color marinerBlue = Color(0xff296ecb);
}

class CryptoColors {
  static Color btc = Color(0xfff7931b);
  static Color eth = Color(0xff627eea);
  static Color ada = Color(0xff656667);
  static Color usdt = Color(0xff27a17b);
  static Color bnb = Color(0xfff3ba2f);
  static Color xrp = Color(0xff656667);
  static Color sol = Color(0xff67f9a1);
  static Color dot = Color(0xffe60e7a);
  static Color usdc = Color(0xff3f73c4);
  static Color doge = Color(0xffc3a634);
  static Color uni = Color(0xffff0f7a);
  static Color link = Color(0xff295ada);
  static Color ltc = Color(0xffbfbbbb);
  static Color algo = Color(0xff656667);
  static Color bch = Color(0xff8dc351);
  static Color wbtc = Color(0xff656667);
  static Color atom = Color(0xff2e3148);
  static Color icp = Color(0xff656667);
  static Color fil = Color(0xff42c1ca);
  static Color matic = Color(0xff6f41d8);
  static Color trx = Color(0xffef0126);
  static Color xlm = Color(0xff656667);
  static Color etc = Color(0xff328332);
  static Color vet = Color(0xff14bdff);
  static Color dai = Color(0xfff4b731);
  static Color xtz = Color(0xffa6e007);

  static Map<String, Color> _map = {
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
