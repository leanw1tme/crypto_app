import 'package:animated_search_bar/animated_search_bar.dart';
import 'package:crypto_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.white,
        actions: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Expanded(
                //Поиск (не закончен)
                child: AnimatedSearchBar(
                  label: 'Криптовалюта',
                  labelStyle: TextStyle(fontSize: 25.sp),
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
              ),
            ),
          )
        ],
      ),
      body: const ListCoins(),
    );
  }
}
