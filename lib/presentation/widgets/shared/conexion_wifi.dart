import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../config/provider/check_internet_provider.dart';

class ConexionWifi extends StatefulWidget {
  const ConexionWifi({super.key, required this.child});

  final Widget child;

  @override
  State<ConexionWifi> createState() => _ConexionWifiState();
}

class _ConexionWifiState extends State<ConexionWifi> {

  @override
  void initState() {
    super.initState();
    context.read<CheckInternetProvider>().initConnectivity();
  }

  @override
  void dispose() {
    context.read<CheckInternetProvider>().connectivitySubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final CheckInternetProvider checkProvider = context.watch<CheckInternetProvider>();
    return checkProvider.checkInternet() 
          ? widget.child
          : const Text('NOT INTERNET');
  }
}
