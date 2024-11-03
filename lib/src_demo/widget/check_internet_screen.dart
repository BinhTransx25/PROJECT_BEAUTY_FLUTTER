import 'dart:async';
import 'dart:developer' as developer;
<<<<<<<< HEAD:lib/src_demo/widget/check_internet_screen.dart
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'loadingscreen2.dart'; // Import Loadingscreen2
import 'notfindscrren.dart'; // Import NotFoundScreen
========

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
>>>>>>>> hung-dev:lib/checkinternet.dart

class CheckInternet extends StatefulWidget {
  const CheckInternet({Key? key}) : super(key: key);

  @override
  State<CheckInternet> createState() => _CheckInternetState();
}

class _CheckInternetState extends State<CheckInternet> {
  ConnectivityResult _connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    initConnectivity();

<<<<<<<< HEAD:lib/src_demo/widget/check_internet_screen.dart
    // Lắng nghe thay đổi kết nối và cập nhật trạng thái
========
>>>>>>>> hung-dev:lib/checkinternet.dart
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus as void Function(List<ConnectivityResult> event)?) as StreamSubscription<ConnectivityResult>;
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

<<<<<<<< HEAD:lib/src_demo/widget/check_internet_screen.dart
  // Hàm khởi tạo kết nối để kiểm tra trạng thái ban đầu
  Future<void> initConnectivity() async {
    late ConnectivityResult result;
========
  Future<void> initConnectivity() async {
    late ConnectivityResult result;

>>>>>>>> hung-dev:lib/checkinternet.dart
    try {
      result = (await _connectivity.checkConnectivity()) as ConnectivityResult;
    } on PlatformException catch (e) {
      developer.log('Couldn\'t check connectivity status', error: e);
      return;
    }

    if (!mounted) {
<<<<<<<< HEAD:lib/src_demo/widget/check_internet_screen.dart
      return;
    }

    _updateConnectionStatus(result);
  }

  // Cập nhật trạng thái kết nối
  void _updateConnectionStatus(ConnectivityResult result) {
    setState(() {
      _connectionStatus = result;
    });

    // Điều hướng dựa trên trạng thái kết nối
    if (result == ConnectivityResult.none) {
      // Không có kết nối, điều hướng đến NotFoundScreen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => NotFoundScreen()),
      );
    } else {
      // Có kết nối WiFi hoặc Mobile, điều hướng đến Loadingscreen2
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Loadingscreen2()),
      );
    }
  }

  // Lấy thông báo trạng thái kết nối
========
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    setState(() {
      _connectionStatus = result;
    });
  }

>>>>>>>> hung-dev:lib/checkinternet.dart
  String getConnectStatusMess(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.wifi:
        return "Đang kết nối với wifi";
      case ConnectivityResult.mobile:
        return "Đang kết nối với mobile";
      case ConnectivityResult.none:
<<<<<<<< HEAD:lib/src_demo/widget/check_internet_screen.dart
        return "Không có kết nối";
      default:
        return "Trạng thái không xác định";
========
        return "Đang không có kết nối";
      default:
        return "Trạng thái không biết";
>>>>>>>> hung-dev:lib/checkinternet.dart
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
<<<<<<<< HEAD:lib/src_demo/widget/check_internet_screen.dart
        title: const Text('Kiểm tra kết nối Internet'),
        elevation: 4,
      ),
      body: Center(
        child: Text(
          'Trạng thái kết nối: ${getConnectStatusMess(_connectionStatus)}',
          style: const TextStyle(fontSize: 18),
        ),
      ),
========
        title: const Text('No internet builder'),
        elevation: 4,
      ),
      body: Center(
          child: Text(
              'Connection Status: ${getConnectStatusMess(_connectionStatus)}')),
>>>>>>>> hung-dev:lib/checkinternet.dart
    );
  }
}
