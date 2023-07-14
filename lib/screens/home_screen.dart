import 'package:animated_search_bar/animated_search_bar.dart';
import 'package:crypto_app/widgets/home/list_coins.dart';
import 'package:flutter/material.dart';

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
        excludeHeaderSemantics: true,
        title: Text(
          'Криптовалюта',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Expanded(
                child: AnimatedSearchBar(
                  label: 'Криптовалюта',
                  labelStyle: const TextStyle(fontSize: 25),
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
