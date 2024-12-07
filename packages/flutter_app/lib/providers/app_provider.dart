import 'package:flutter/material.dart';
import 'package:reown_appkit/reown_appkit.dart';

// app_provider.dart
class AppProvider with ChangeNotifier, WidgetsBindingObserver {
  late ReownAppKitModal appKitModal;
  bool _isConnected = false;
  String _userAddress = '';

  bool get isConnected => _isConnected;
  String get userAddress => _userAddress;

  Future<void> initializeAppKitModal(BuildContext context) async {
    appKitModal = ReownAppKitModal(
      context: context,
      projectId: '044601f65212332475a09bc14ceb3c34',
      metadata: const PairingMetadata(
        name: 'Celo Composer',
        description: 'Memecoin trading made easy',
        url: 'https://celo-composer.com/',
        icons: ['assets/images/logo.png'],
      ),
    );

    await appKitModal.init();

    // Add listener like AppKitModalConnectButton
    appKitModal.addListener(_updateState);
    _updateState();
  }

  @override
  void dispose() {
    appKitModal.removeListener(_updateState);
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void _updateState() {
    final wasConnected = _isConnected;
    _isConnected = appKitModal.isConnected;
    _userAddress = appKitModal.session?.getAddress('') ?? '';

    if (wasConnected != _isConnected) {
      notifyListeners();
    }
  }
}
