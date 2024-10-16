import 'package:firebase_remote_config/firebase_remote_config.dart';

class FirebaseRemoteConfigService {
  final FirebaseRemoteConfig _remoteConfig = FirebaseRemoteConfig.instance;

  Future<void> init() async {
    await _remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: Duration(seconds: 10),
      minimumFetchInterval: Duration(hours: 1),
    ));
    await _fetchRemoteConfig();
  }

  Future<void> _fetchRemoteConfig() async {
    try {
      await _remoteConfig.fetchAndActivate();
      print('Remote config fetched and activated');
    } catch (e) {
      print('Failed to fetch remote config: $e');
    }
  }

  String getStringValue(String key, String defaultValue) {
    return _remoteConfig.getString(key) ?? defaultValue;
  }
}
