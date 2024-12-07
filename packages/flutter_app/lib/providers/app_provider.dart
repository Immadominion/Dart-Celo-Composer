import 'package:flutter/material.dart';
import 'package:reown_appkit/reown_appkit.dart';

class AppProvider with WidgetsBindingObserver {
  late ReownAppKitModal appKitModal;

  Future<void> initializeAppKitModal(BuildContext context) async {
    // Initialize app kit modal
    appKitModal = ReownAppKitModal(
      context: context,
      projectId: '2009f3949892128ca51c1d44fd59e939',
      metadata: const PairingMetadata(
        name: 'Oracle AI',
        description: 'Memecoin trading made easy',
        url: 'https://certifyme.live/',
        icons: ['assets/images/oracle.png'],
      ),
    );

    await appKitModal.init();
  }
}
