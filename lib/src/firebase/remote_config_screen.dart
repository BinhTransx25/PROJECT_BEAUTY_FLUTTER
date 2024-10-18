import 'package:flutter/material.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

class RemoteConfigScreen extends StatefulWidget {
  @override
  _RemoteConfigScreenState createState() => _RemoteConfigScreenState();
}

class _RemoteConfigScreenState extends State<RemoteConfigScreen> {
  final FirebaseRemoteConfig _remoteConfig = FirebaseRemoteConfig.instance;
  String _fetchedValue = 'No value fetched';

  @override
  void initState() {
    super.initState();
    initRemoteConfig();
  }

  Future<void> initRemoteConfig() async {
    await _remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: Duration(seconds: 10),
      minimumFetchInterval: Duration(hours: 1),
    ));

    await _remoteConfig.fetchAndActivate();
    setState(() {
      _fetchedValue = _remoteConfig.getString('your_key_here'); // Thay 'your_key_here' bằng key bạn đã định nghĩa trong Firebase Console
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase Remote Config'),
      ),
      body: Center(
        child: Text('Fetched Value: $_fetchedValue'),
      ),
    );
  }
}
