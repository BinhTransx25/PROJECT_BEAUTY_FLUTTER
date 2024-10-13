<<<<<<< HEAD
import 'package:beauty/Localization_test.dart';
import 'package:beauty/core/app_localizations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
<<<<<<< HEAD
<<<<<<< HEAD
// import 'src/widget/splash_widget.dart';
import 'package:easy_localization/easy_localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('vi')],
      path: 'assets/translations',
      fallbackLocale: Locale('en'),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: LanguageSwitcher(), // Sử dụng widget chuyển đổi ngôn ngữ
    );
  }
}

class LanguageSwitcher extends StatefulWidget {
  @override
  _LanguageSwitcherState createState() => _LanguageSwitcherState();
}

class _LanguageSwitcherState extends State<LanguageSwitcher> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('hello_world').tr(), 
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String newLang =
                    context.locale.languageCode == 'en' ? 'vi' : 'en';
                changeLanguage(context, newLang);
                setState(() {});
              },
              child: Text('change_language').tr(),
            ),
          ],
        ),
      ),
    );
  }
}

void changeLanguage(BuildContext context, String langCode) {
  Locale newLocale = Locale(langCode);
  print('Changing language to: $langCode');
  context.setLocale(newLocale);
}
// void main() {
//     /** await Firebase.initializeApp();  */ 
//   runApp(const MyApp());
  
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
   
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});


//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
     
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }


// class LogoWidget extends StatelessWidget {
//   final String logoUrl;

//   LogoWidget({required this.logoUrl});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(16.0),
//       child: Image.network(logoUrl), // Hoặc sử dụng Image.asset nếu bạn có file logo trong assets
//     );
//   }
// }
// // để sài sau 
// /**
// class GoRouter extends StatelessWidget {
//   final GoRouter _router = GoRouter(
//     routes: [
//       GoRoute(
//         path: '/',
//         builder: (context, state) => SplashScreen(),
//       ),
//       GoRoute(
//         path: '/home',
//         builder: (context, state) => HomePage(),
//       ),
//     ],
//   );

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp.router(
//       routerDelegate: _router.routerDelegate,
//       routeInformationParser: _router.routeInformationParser,
//     );
//   }
// }



// class Firebase extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: Text('Firebase Setup')),
//         body: Center(child: Text('Firebase Initialized')),
//       ),
//     );
//   }
// }



// void setupFirebaseMessaging() {
//   FirebaseMessaging messaging = FirebaseMessaging.instance;
//   messaging.requestPermission();

//   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//     print('Received a message: ${message.notification?.body}');
//   });
// }
 


// FirebaseAnalytics analytics = FirebaseAnalytics();
// class FirebaseAnalytics extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       navigatorObservers: [
//         FirebaseAnalyticsObserver(analytics: analytics),
//       ],
//     );
//   }
// }



// void setupRemoteConfig() async {
//   FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;
//   await remoteConfig.setConfigSettings(RemoteConfigSettings(
//     fetchTimeout: Duration(minutes: 1),
//     minimumFetchInterval: Duration(hours: 1),
//   ));

//   await remoteConfig.fetchAndActivate();
//   print('Remote Config: ${remoteConfig.getString('welcome_message')}');
// }
//  */

=======
import 'package:my_app/checkinternet.dart';
import 'package:my_app/loadingscreen.dart';
import 'package:my_app/loadingscreen2.dart';
import 'package:my_app/notfindscrren.dart';

<<<<<<< HEAD
void main() {
  runApp(const MyApp());
=======
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
    /** await Firebase.initializeApp();  */ 
  runApp(EasyLocalization(
      supportedLocales:  const [
        Locale('en', 'US'),
        Locale('vi'),
        Locale('th')
      ],
      path: AppLocalizations.translationFilePath,
      saveLocale: true,
      fallbackLocale: AppLocalizations.engLocale,
      startLocale: AppLocalizations.engLocale,
      child: const MyApp()));
  
>>>>>>> origin/khuong-dev
=======
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'src/widget/splash_widget.dart';

void main() {
  /** await Firebase.initializeApp();  */
  runApp(const MyApp());
>>>>>>> hung-dev
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
<<<<<<< HEAD
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'OpenSans'),
      home: CheckInternet(),
=======
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LocalizationTest(),
>>>>>>> origin/khuong-dev
=======
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
>>>>>>> origin/ngan-dev
    );
  }
}
<<<<<<< Updated upstream
>>>>>>> tri-dev
=======

<<<<<<< HEAD
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

  const LogoWidget({super.key, required this.logoUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
<<<<<<< HEAD
      padding: const EdgeInsets.all(16.0),
      child: Image.network(logoUrl), // Hoặc sử dụng Image.asset nếu bạn có file logo trong assets
    );
  }
}
=======
>>>>>>> origin/ngan-dev
// để sài sau 
=======
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
              child: QRView(
                key: qrKey,
                onQRViewCreated: _onQRViewCreated,
                overlay: QrScannerOverlayShape(
                    borderColor: Colors.white,
                    borderRadius: 8,
                    borderLength: 20),
              )),
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
}
// để sài sau
>>>>>>> hung-dev
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
<<<<<<< HEAD

>>>>>>> Stashed changes
=======
>>>>>>> hung-dev
