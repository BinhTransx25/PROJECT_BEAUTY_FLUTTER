import 'package:flutter/material.dart';
import '../bloc/login_bloc/login_bloc.dart';

class BlocRefreshNotifier extends ChangeNotifier {
  BlocRefreshNotifier(LoginBloc loginBloc) {
    loginBloc.stream.listen((state) {
      notifyListeners();
    });
  }
}
