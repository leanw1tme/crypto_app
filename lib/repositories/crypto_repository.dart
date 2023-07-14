import 'package:crypto_app/models/data/main_data.dart';
import 'package:dio/dio.dart';

class CryptoCoinsRepository {
  CryptoCoinsRepository(this.dio);
  static String mainUrl = "https://api.coingecko.com/api/v3/";
  var currencyListingAPI =
      '${mainUrl}coins/markets?vs_currency=usd&sparkline=true';
  final Dio dio;

  Future<MainData> getCryptoCoins() async {
    try {
      Response response = await dio.get(currencyListingAPI);
      return MainData.fromJson((response.data));
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return MainData.withError("error");
    }
  }
}
