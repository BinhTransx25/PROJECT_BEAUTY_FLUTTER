import 'package:beauty/src/Screen/Onboarding_Signin_up_Splash/Onboarding%20-%20Start.dart';
import 'package:beauty/src/Screen/Onboarding_Signin_up_Splash/Onboarding.dart';
import 'package:beauty/src/Screen/Onboarding_Signin_up_Splash/Signin.dart';
import 'package:beauty/src/Screen/Onboarding_Signin_up_Splash/Signup.dart';
import 'package:go_router/go_router.dart';
import '../../Screen/Password_Recovery_Reset/Password Recovery.dart';
import '../../Screen/Password_Recovery_Reset/PasswordRecoveryEmail.dart';
import '../../Screen/Password_Recovery_Reset/PasswordRecoveryPhone.dart';
import '../../Screen/Password_Recovery_Reset/ResetPassword.dart';
import '../../Screen/Password_Recovery_Reset/VerificationCode.dart';
import 'package:beauty/src/Screen/Onboarding_Signin_up_Splash/signin_screen.dart';

class AuthenRouter {
  static final List<GoRoute> routes = [
    GoRoute(
      path: '/onnboardingstart',
      builder: (context, state) => OnboardingStartScreen(),
    ),
    GoRoute(
      path: '/onnboarding',
      builder: (context, state) => OnboardingScreen(),
    ),
    GoRoute(
      path: '/sign_up',
      builder: (context, state) => SignupScreen(),
    ),
    GoRoute(
      path: '/signin',
      builder: (context, state) => SigninScreen(),
    ),
    GoRoute(
      path: '/passwordRecovery',
      builder: (context, state) => PasswordRecovery(),
    ),
    GoRoute(
      path: '/passwordRecoveryPhone',
      builder: (context, state) => PasswordRecoveryPhone(),
    ),
    GoRoute(
      path: '/passwordRecoveryEmail',
      builder: (context, state) => PasswordRecoveryEmail(),
    ),
    GoRoute(
      path: '/resetpassword',
      builder: (context, state) => Resetpassword(),
    ),
    GoRoute(
      path: '/verificationcode',
      builder: (context, state) => Verificationcode(),
    ),
    GoRoute(
      path: '/signin_screen',
      builder: (context, state) => SignInScreen(),
    ),
  ];
}
