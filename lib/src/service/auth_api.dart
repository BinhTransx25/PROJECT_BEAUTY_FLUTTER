
import "../models/user/user_model.dart";
import 'package:dio/dio.dart';
import 'dart:convert';
import 'api_client.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthApi {

  Future<UserModel> login(String identifier, String password) async {
    final response = await apiClient.post('/users/login_user', data: {
      'identifier': identifier,
      'password': password,
    });

    if (response.statusCode == 200) {
      return UserModel.fromJson(response.data);
    } else {
      throw Exception('Đăng nhập thất bại');
    }
  }
}
final AuthApi = AuthApi();


  // final Dio _dio = Dio();

  // final ApiClient _apiClient;

  // AuthApi(this._apiClient);

  // Future<Map<String, dynamic>> login() async {
  //   try {
  //     final response = await _apiClient.dio.post('/users/login_user', data: {
  //       'identifier': identifier,
  //       'password': password,
  //     });
  //     return response.data; // Trả về JSON chứa thông tin người dùng
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

// Future<bool> login(UserModel userModel) async {
//     const String url = 'http://localhost:9999/users/login_user';
    
//     try {
//       final response = await _dio.post(url, data: {
//         "identifier": userModel.email,
//         "password": userModel.password,
        
//       });

//       if (response.statusCode == 200) {
//         var responseData =
//             response.data is String ? jsonDecode(response.data) : response.data;

//         if (responseData != null) {
//           Fluttertoast.showToast(msg: 'Đăng nhập thành công');
//           return true;
//         } else {
//           Fluttertoast.showToast(msg: 'Không tìm thấy token');
//           return false;
//         }
//       } else {
//         Fluttertoast.showToast(msg: 'Đăng nhập thất bại');
//         return false;
//       }
//     } on DioException catch (e) {
//       Fluttertoast.showToast(msg: 'Lỗi: ${e.message}');
//       return false;
//     } catch (e) {
//       Fluttertoast.showToast(msg: 'Lỗi: $e');
//       return false;
//     }
//   }


