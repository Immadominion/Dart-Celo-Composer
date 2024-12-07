import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import '../widgets/header.dart';
import '../widgets/footer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // Initialize AppKitModal when HomeScreen is created
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AppProvider>().initializeAppKitModal(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Consumer<AppProvider>(
                builder: (context, appProvider, _) => Text(
                  appProvider.isConnected
                      ? 'Your address: ${appProvider.userAddress}'
                      : 'No Wallet Connected',
                ),
              ),
            ),
          ),
          const Footer(),
        ],
      ),
    );
  }
}
