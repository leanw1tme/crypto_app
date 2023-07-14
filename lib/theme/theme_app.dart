import 'package:crypto_app/screens/home_screen.dart';
import 'package:flutter/material.dart';

class CryptoApp extends StatelessWidget {
  const CryptoApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Colors.white,
        ),
        textTheme: const TextTheme(
            titleLarge: TextStyle(
                color: Colors.black, fontSize: 26, fontWeight: FontWeight.w400),
            titleMedium: TextStyle(fontSize: 35, fontWeight: FontWeight.w500),
            labelLarge: TextStyle(fontSize: 25),
            labelMedium: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
            bodySmall: TextStyle(fontSize: 16, color: Colors.grey),
            displaySmall: TextStyle(fontSize: 16)),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
