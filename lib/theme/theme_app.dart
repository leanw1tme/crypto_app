import 'package:crypto_app/screens/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CryptoApp extends StatelessWidget {
  const CryptoApp({super.key});

  @override
  Widget build(BuildContext context) {
    //Адаптация экрана приложения
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            color: Colors.white,
          ),
          textTheme: TextTheme(
              titleLarge: TextStyle(
                  color: Colors.black,
                  fontSize: 26.sp,
                  fontWeight: FontWeight.w400),
              titleMedium:
                  TextStyle(fontSize: 35.sp, fontWeight: FontWeight.w500),
              labelLarge: TextStyle(fontSize: 25.sp),
              labelMedium: TextStyle(
                fontSize: 17.sp,
                fontWeight: FontWeight.w500,
              ),
              bodySmall: TextStyle(fontSize: 16.sp, color: Colors.grey),
              displaySmall: TextStyle(fontSize: 16.sp)),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
