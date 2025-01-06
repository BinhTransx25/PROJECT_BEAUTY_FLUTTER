import 'package:flutter/material.dart';

import '../bloc/auth/auth_bloc.dart';

// class BlocRefreshNotifier extends ChangeNotifier {
//   BlocRefreshNotifier(LoginBloc loginBloc) {
//     loginBloc.stream.listen((state) {
//       notifyListeners();
//     });
//   }
// }
class BlocRefreshNotifier extends ChangeNotifier {
  BlocRefreshNotifier(AuthBloc authBloc) {
    authBloc.stream.listen((state) {
      notifyListeners();
    });
  }
}
