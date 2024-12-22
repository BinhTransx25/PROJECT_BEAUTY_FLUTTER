import 'package:dio/dio.dart';

class SettingService {
  late final Dio _dio;
  final String _baseUrl = 'http://api-core.dsp.one/api/auth';

  SettingService() {
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

  // Phương thức lấy dữ liệu từ API /setting
  Future<Map<String, dynamic>> getSetting() async {
    try {
      // Gửi yêu cầu GET đến API
      final response = await _dio.get('/setting');

      // Kiểm tra phản hồi
      if (response.statusCode == 200) {
        print("Lấy thông tin thành công: ${response.data}");
        return response.data;
      }

      print("Lấy thông tin thất bại: ${response.data}");
      return {};
    } catch (e) {
      if (e is DioException) {
        print('Lỗi API: ${e.response?.data}');
        throw Exception(
            e.response?.data?['message'] ?? 'Lỗi mạng: ${e.message}');
      }
      print('Lỗi không xác định: $e');
      rethrow;
    }
  }
}
