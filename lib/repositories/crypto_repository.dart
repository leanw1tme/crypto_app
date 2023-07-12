import 'package:crypto_app/models/main_data.dart';
import 'package:dio/dio.dart';

class CryptoCoinsRepository {
  static String mainUrl = "https://pro-api.coinmarketcap.com/v1/";
  final String apiKey = "4acba772-a607-450b-b2bd-1e85afb59154";
  var currencyListingAPI = '${mainUrl}cryptocurrency/listings/latest';
  Dio _dio = Dio();
  Future<MainData> getCryptoCoins() async {
    try {
      _dio.options.headers["X-CMC_PRO_API_KEY"] = apiKey;
      Response response = await _dio.get(currencyListingAPI);
      return MainData.fromJson((response.data));
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return MainData.withError("error");
    }
  }
}
