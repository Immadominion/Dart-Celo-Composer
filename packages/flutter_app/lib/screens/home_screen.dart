import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import '../widgets/header.dart';
import '../widgets/footer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AppProvider appProvider = AppProvider();

    return Scaffold(
      appBar: const Header(),
      body: Column(
        children: [
          // Expanded(
          //   child: Center(
          //     child: appProvider.isConnected
          //         ? Text('Your address: ${appProvider.userAddress}')
          //         : const Text('No Wallet Connected'),
          //   ),
          // ),
          const Footer(),
        ],
      ),
    );
  }
}
