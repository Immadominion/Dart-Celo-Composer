import 'package:flutter/material.dart';
import 'package:flutter_app/providers/app_provider.dart';
// import 'package:provider/provider.dart';
import 'package:reown_appkit/modal/widgets/public/appkit_modal_connect_button.dart';

class Header extends StatefulWidget implements PreferredSizeWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _HeaderState extends State<Header> with WidgetsBindingObserver {
  final AppProvider appProvider = AppProvider();
  @override
  void initState() {
    super.initState();
    appProvider.initializeAppKitModal(context);
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Celo Composer dApp'),
      actions: [
        AppKitModalConnectButton(
          context: context,
          appKit: appProvider.appKitModal,
        ),
      ],
    );
  }
}
