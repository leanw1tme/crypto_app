import 'package:crypto_app/repositories/repositories.dart';
import 'package:crypto_app/theme/theme_app.dart';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() {
  //Внедрение инъекции зависимости
  GetIt.I.registerSingleton(CryptoCoinsRepository());
  //Запуск приложения
  runApp(const CryptoApp());
}
