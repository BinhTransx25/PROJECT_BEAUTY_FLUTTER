import 'package:beauty/src/Screen/Onboarding_Signin_up_Splash/Onboarding%20-%20Start.dart';
import 'package:beauty/src/Screen/Onboarding_Signin_up_Splash/Onboarding.dart';
import 'package:beauty/src/Screen/Onboarding_Signin_up_Splash/Signin.dart';
import 'package:beauty/src/Screen/Onboarding_Signin_up_Splash/Signup.dart';
import 'package:beauty/src/Screen/Onboarding_Signin_up_Splash/splash_widget.dart';
import 'package:go_router/go_router.dart';

class MyAppRouter {
  GoRouter router = GoRouter(
    initialLocation: "/splash",
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
    ],
  );
}
