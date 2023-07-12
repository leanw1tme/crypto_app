import 'package:crypto_app/widgets/home/list_coins.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
        actions: const [
          Icon(Icons.search),
          SizedBox(
            width: 15,
          )
        ],
      ),
      body: const ListCoins(),
    );
  }
}
