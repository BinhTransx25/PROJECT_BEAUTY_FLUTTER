import 'package:beauty/src/widget/HomeScreen.dart';
import 'package:beauty/src/widget/Onboarding%20-%20Start.dart';
import 'package:beauty/src/widget/Onboarding.dart';
import 'package:beauty/src/widget/Signin.dart';
import 'package:beauty/src/widget/Signup.dart';
import 'package:beauty/src/widget/splash_widget.dart';
import 'package:go_router/go_router.dart';

class MyAppRouter {
  GoRouter router = GoRouter(
    initialLocation: "/home",
    routes: [
      GoRoute(
        name: "Splash",
        path: '/splash',
        builder: (context, state) => SplashWidget(),
      ),
      GoRoute(
          path: '/onnboardingstart',
          name: 'OnboardingStartScreen',
          builder: (context, state) => OnboardingStartScreen()),
      GoRoute(
          path: '/onnboarding',
          name: 'OnboardingScreen',
          builder: (context, state) => OnboardingScreen()),
      GoRoute(
          path: '/signup',
          name: 'SignupScreen',
          builder: (context, state) => SignupScreen()),
      GoRoute(
          path: '/signin',
          name: 'SigninScreen',
          builder: (context, state) => SigninScreen()),
      GoRoute(
          path: '/home',
          name: 'HomeScreen',
          builder: (context, state) => HomeScreen()),
    ],
  );
}
