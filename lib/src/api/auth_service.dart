import 'dart:convert';
import 'package:beauty/src/models/user/user_models.dart';
import 'package:dio/dio.dart';

import 'package:fluttertoast/fluttertoast.dart';

class AuthService {
  final Dio _dio = Dio();

  Future<bool> register(UserRequest userRequest) async {
    const String url = 'https://api-core.dsp.one/api/auth/user/register';

    try {
      final response = await _dio.post(
        url,
        data: {
          "name": userRequest.name,
          "nick_name": userRequest.nickName,
          "email": userRequest.email,
          "address": userRequest.address,
          "phone": userRequest.phone,
          "password": userRequest.password,
          "password_confirmation": userRequest.passwordConfirmation,
          "customer_id": userRequest.customerId,
        },
      );
      print('Response Status Code: ${response.statusCode}');
      print('Response Data: ${response.data}');

      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } on DioError catch (e) {
      print('DioError: ${e.response?.data}');
      return false;
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }

  Future<bool> login(UserRequest userRequest) async {
    const String url = 'https://api-core.dsp.one/login';

    try {
      final response = await _dio.post(url, data: {
        "phone": userRequest.phone,
        "email": userRequest.email,
        "password": userRequest.password,
        "customer_group_id": 1,
      });

      if (response.statusCode == 200) {
        var responseData =
            response.data is String ? jsonDecode(response.data) : response.data;

        if (responseData != null) {
          Fluttertoast.showToast(msg: 'Đăng nhập thành công');
          return true;
        } else {
          Fluttertoast.showToast(msg: 'Không tìm thấy token');
          return false;
        }
      } else {
        Fluttertoast.showToast(msg: 'Đăng nhập thất bại');
        return false;
      }
    } on DioError catch (e) {
      Fluttertoast.showToast(msg: 'Lỗi: ${e.message}');
      return false;
    } catch (e) {
      Fluttertoast.showToast(msg: 'Lỗi: $e');
      return false;
    }
  }

  Future<bool> resetpw(UserRequest userRequest) async {
    const String url = 'https://api-core.dsp.one/api/password/reset-password';

    try {
      final response = await _dio.post(
        url,
        data: {
          "email": userRequest.email,
          "password": userRequest.password,
          "comfimpassword": userRequest.passwordConfirmation
        },
      );

      if (response.statusCode == 200) {
        print('Password reset successful: ${response.data}');
        return true;
      } else {
        print('Password reset failed with status code: ${response.statusCode}');
        print('Response data: ${response.data}');
        return false;
      }
    } on DioError catch (e) {
      if (e.response != null) {
        print('DioError: ${e.response?.statusCode}');
        print('DioError response data: ${e.response?.data}');
      } else {
        print('DioError: ${e.message}');
      }
      return false;
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }

  Future<bool> otp(UserRequest userRequest) async {
    const String url = 'https://api-core.dsp.one/api/password/send-otp';

    try {
      final response = await _dio.post(
        url,
        data: {
          "email": userRequest.email,
        },
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on DioError catch (e) {
      print('DioError: ${e.response?.data}');
      return false;
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }

  Future<bool> veriotp(OtpRequest otpRequest) async {
    const String url = 'https://api-core.dsp.one/api/password/verify-otp';

    try {
      final response = await _dio.post(
        url,
        data: {
          "email": otpRequest.email,
          "otp": otpRequest.otp,
        },
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on DioError catch (e) {
      print('DioError: ${e.response?.data}');
      return false;
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }

  getToken() {}
}
