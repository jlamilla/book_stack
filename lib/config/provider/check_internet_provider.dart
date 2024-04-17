
import 'dart:async';
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CheckInternetProvider extends ChangeNotifier{
    List<ConnectivityResult> _connectionStatus = <ConnectivityResult>[ConnectivityResult.none];
    late StreamSubscription<List<ConnectivityResult>> connectivitySubscription;
    final Connectivity _connectivity = Connectivity();


  Future<void> initConnectivity() async {
    connectivitySubscription = _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    List<ConnectivityResult> result;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      log("Couldn't check connectivity status", error: e);
      return;
    }
    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(List<ConnectivityResult> result) async {
    _connectionStatus = result;
    notifyListeners();
  }

  bool checkInternet(){
    for (final ConnectivityResult connection in _connectionStatus) {
      switch (connection) {
        case ConnectivityResult.mobile:
          {
          notifyListeners();
          return true;
          }
        case ConnectivityResult.wifi:
          {
          notifyListeners();
          return true;
          }
        case ConnectivityResult.bluetooth:
        {
          notifyListeners();
          return false;
        }
        case ConnectivityResult.ethernet:
        {
          notifyListeners();
          return false;
        }
        case ConnectivityResult.none:
        {
          notifyListeners();
          return false;
        }
        case ConnectivityResult.vpn:
        {
          notifyListeners();
          return false;
        }
        case ConnectivityResult.other:
        {
          notifyListeners();
          return false;
        }
      }
    }
    return false;
  }
}
