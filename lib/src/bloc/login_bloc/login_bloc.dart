import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    _loadLoginStatus(); // Tải trạng thái đăng nhập từ SharedPreferences khi khởi tạo

    on<LoginRequested>((event, emit) async {
      emit(LoginInProgress());

      // Giả sử đây là logic kiểm tra đăng nhập
      await Future.delayed(Duration(seconds: 1));

      if (event.username == 'binh@gmail.com' && event.password == '123') {
        emit(LoginSuccess());
        await _saveLoginStatus(true); // Lưu trạng thái đăng nhập
      } else {
        emit(LoginFailure(error: 'Invalid username or password'));
      }
    });

    on<LogoutRequested>((event, emit) async {
      emit(LoginInitial());
      await _saveLoginStatus(false); // Xóa trạng thái đăng nhập
    });
  }

  Future<void> _saveLoginStatus(bool isLoggedIn) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', isLoggedIn);
  }

  Future<void> _loadLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    if (isLoggedIn) {
      // ignore: invalid_use_of_visible_for_testing_member
      emit(LoginSuccess());
    }
  }
}
