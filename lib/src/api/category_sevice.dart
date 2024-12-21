import 'package:beauty/src/models/home/catergory.dart';
import 'package:dio/dio.dart';

class CategoryService {
  late final Dio _dio;
  final String _baseUrl = 'https://api-core.dsp.one/api';
  // https://api-core.dsp.one/api/auth/category

  CategoryService() {
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

  Future<List<Category>> getCategories() async {
    try {
      // Gửi yêu cầu GET
      final response = await _dio.get('/auth/category');

      // Kiểm tra phản hồi
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['data'] as List<dynamic>;
        print("Lấy danh sách (ok): ${response..data['data']}");

        return data
            .where((category) => category['is_active'] == 1)
            .map((item) => Category.fromJson(item))
            .toList();
      }

      print("Lấy danh sách thất bại: ${response.data}");
      return [];
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
