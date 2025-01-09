// import 'package:dio/dio.dart';
// import 'package:retrofit/error_logger.dart';
// import 'package:retrofit/http.dart';
// import '../../src/models/user/user_model.dart';

// part 'api_client.g.dart';

// @RestApi(baseUrl: "http://192.168.1.61:9999")
// abstract class ApiClient {
//   factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

//   @POST("/users/login_user")
//   Future<UserModel> loginUser(@Body() Map<String, String> credentials);
// }

// import 'package:dio/dio.dart';

// class ApiClient {
//   final Dio dio;

//   ApiClient(Dio dio)
//       : dio = Dio(BaseOptions(
//           baseUrl: 'https://localhost:9999',
//           connectTimeout: const Duration(milliseconds: 1000), 
//           receiveTimeout: const Duration(milliseconds: 1000),
//         )) {
//     dio.interceptors.add(LogInterceptor(responseBody: true));
//   }

//   Future<Response> post(String path, {Map<String, dynamic>? data}) {
//     return dio.post(path, data: data);
//   }
// }

import 'package:dio/dio.dart';

class ApiClient {
  final Dio _dio = Dio(
    BaseOptions(
    baseUrl: "http://localhost:9999", // Thay bằng URL của API
    connectTimeout: const Duration(milliseconds: 1000), 
    receiveTimeout: const Duration(milliseconds: 1000),
  ));

  Future<Response> post(String path, {Map<String, dynamic>? data}) async {
    try {
      return await _dio.post(path, data: data);
    } catch (e) {
      rethrow;
    }
  }
}
final apiClient = ApiClient();
