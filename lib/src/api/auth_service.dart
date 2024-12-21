import 'package:dio/dio.dart';
import '../models/user/user_models.dart';

class AuthService {
  late final Dio _dio;
  final String _baseUrl = 'https://api-core.dsp.one/api';

  AuthService() {
    _dio = Dio(BaseOptions(
      baseUrl: _baseUrl,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ));
  }

  Future<bool> register(UserRequest request) async {
    try {
      // Convert UserRequest thành JSON
      final requestData = request.toJson();

      // Gửi yêu cầu POST
      final response = await _dio.post(
        '/auth/user/register',
        data: requestData,
      );

      // Kiểm tra phản hồi
      if (response.statusCode == 200 || response.statusCode == 201) {
        print("Đăng ký thành công: ${response.data}");
        return true;
      }

      print("Đăng ký thất bại: ${response.data}");
      return false;
    } catch (e) {
      if (e is DioException) {
        print('Lỗi API: ${e.response?.data}');
        throw Exception(e.response?.data?['message'] ?? 'Lỗi mạng: ${e.message}');
      }
      print('Lỗi không xác định: $e');
      rethrow;
    }
  }
}
