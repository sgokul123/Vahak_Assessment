import 'dart:io';

import 'package:connectivity/connectivity.dart';

class NetworkUtil {
  static Future<bool> isNetworkConnected() async {
    try {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.mobile) {
        return true;
        // I am connected to a mobile network.
      } else if (connectivityResult == ConnectivityResult.wifi) {
        return true; // I am connected to a wifi network.
      } else if (connectivityResult == ConnectivityResult.none) {
        return false;
      }
      return false;
    } on SocketException catch (e) {
      return false;
    }
  }
}
