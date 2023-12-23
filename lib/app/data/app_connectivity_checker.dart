import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

enum NetworkStatus { Online, Offline }

class AppConnectivityChecker {
  // static late final StreamSubscription connectivitySubscription;
  // static late final ConnectivityResult previousresult;

  static late final StreamController<NetworkStatus> networkStatusController =
      StreamController<NetworkStatus>();

  static NetworkStatusService() {
    Connectivity().onConnectivityChanged.listen((status) {
      networkStatusController.add(_getNetworkStatus(status));
    });
  }

  static NetworkStatus _getNetworkStatus(ConnectivityResult status) {
    NetworkStatus networkStatus = NetworkStatus.Offline;
    if (status != ConnectivityResult.none) {
      InternetConnectionChecker().hasConnection.then((con) => {
            networkStatus = con ? NetworkStatus.Online : NetworkStatus.Offline
            // status == ConnectivityResult.mobile || status == ConnectivityResult.wifi ? NetworkStatus.Online : NetworkStatus.Offline;
          });
    }
    //NetworkStatus networkStatus = status == ConnectivityResult.mobile || status == ConnectivityResult.wifi ? NetworkStatus.Online : NetworkStatus.Offline;
    print("------- intenet status ==== " + networkStatus.name);
    return networkStatus;
  }

  static init() async {
    check();
  }

  static Future<bool> isConnected() async {
    return InternetConnectionChecker().hasConnection;
  }

  static check() {
    Connectivity().onConnectivityChanged.listen((status) {
      networkStatusController.add(_getNetworkStatus(status));
    });
    /*  connectivitySubscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult nowresult) {
      if (nowresult == ConnectivityResult.none) {
        Fluttertoast.showToast(
          msg: "Network Connection Error",
          backgroundColor: ColorConstants.darkGray,
          textColor:  ColorConstants.tipColor,
          fontSize: 16.0,
        );
      } else if (previousresult != null) {
        previousresult = nowresult;
        if (nowresult == ConnectivityResult.mobile) {
          // print('Mobile Network Connected');
          //TODO Flutter Toaster for Mobile
          Fluttertoast.showToast(
            msg: "Mobile Network Connected",
            backgroundColor: ColorConstants.darkGray,
            textColor:  ColorConstants.tipColor,
            fontSize: 16.0,
          );
        } else if (nowresult == ConnectivityResult.wifi) {
          // print('WiFi Network Connected');
          //TODO Flutter Toaster for WiFi
          Fluttertoast.showToast(
            msg: "WiFi Network Connected",
            backgroundColor: ColorConstants.darkGray,
            textColor:  ColorConstants.tipColor,
            fontSize: 16.0,
          );
        }
      }
      else
        // print('Connected');
        if (nowresult == ConnectivityResult.mobile) {
          // print('Mobile Network Connected');
          //TODO Flutter Toaster for Mobile
          Fluttertoast.showToast(
            msg: "Mobile Network Connected",
            backgroundColor: ColorConstants.darkGray,
            textColor:  ColorConstants.tipColor,
            fontSize: 16.0,
          );
        } else if (nowresult == ConnectivityResult.wifi) {
          // print('WiFi Network Connected');
          //TODO Flutter Toaster for WiFi
          Fluttertoast.showToast(
            msg: "WiFi Network Connected",
            backgroundColor: ColorConstants.darkGray,
            textColor:  ColorConstants.tipColor,
            fontSize: 16.0,
          );
        }

      previousresult = nowresult;
  });*/
  }
}
