import 'package:beauty/src/qrcode.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_scanner_overlay/qr_scanner_overlay.dart';
import 'src/widget/splash_widget.dart';

void main() {
  /** await Firebase.initializeApp();  */
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _ScreenQrCode();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class LogoWidget extends StatelessWidget {
  final String logoUrl;

  LogoWidget({required this.logoUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Image.network(
          logoUrl), // Hoặc sử dụng Image.asset nếu bạn có file logo trong assets
    );
  }
}

//quét qrcode
class _ScreenQrCode extends State<MyHomePage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              flex: 6,
              child: QRView(key: qrKey, onQRViewCreated: _onQRViewCreated)),
          Expanded(flex: 1, child: Center(child: Text(result?.code ?? ""))),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
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
