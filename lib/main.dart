// ignore_for_file: unnecessary_const

import 'package:beauty/src/retrofit/HomeScreen.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp()); // Loại bỏ 'const' ở đây
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(), // Loại bỏ 'const' ở đây
    );
  }
}

// để sài sau 
/**
class GoRouter extends StatelessWidget {
  final GoRouter _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => SplashScreen(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => HomePage(),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _router.routerDelegate,
      routeInformationParser: _router.routeInformationParser,
    );
  }
}



class Firebase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Firebase Setup')),
        body: Center(child: Text('Firebase Initialized')),
      ),
    );
  }
}



void setupFirebaseMessaging() {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  messaging.requestPermission();

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Received a message: ${message.notification?.body}');
  });
}
 


FirebaseAnalytics analytics = FirebaseAnalytics();
class FirebaseAnalytics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorObservers: [
        FirebaseAnalyticsObserver(analytics: analytics),
      ],
    );
  }
}



void setupRemoteConfig() async {
  FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;
  await remoteConfig.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: Duration(minutes: 1),
    minimumFetchInterval: Duration(hours: 1),
  ));

  await remoteConfig.fetchAndActivate();
  print('Remote Config: ${remoteConfig.getString('welcome_message')}');
}
 */

