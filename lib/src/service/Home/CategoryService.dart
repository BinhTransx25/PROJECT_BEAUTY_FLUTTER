import 'package:dio/dio.dart';
import '../../models/home/CategoryModel.dart';

class CategoryService {
  final Dio _dio = Dio();
  final String _baseUrl = 'https://api-core.dsp.one/api/auth';

  Future<List<CategoryModel>> getCategories() async {
    try {
      final response = await _dio.get('$_baseUrl/category');
      if (response.statusCode == 200) {
        final List<dynamic> categoriesJson = response.data['data'];
        return categoriesJson
            .where((category) => category['is_active'] == 1)
            .map((json) => CategoryModel.fromJson(json))
            .toList();
      }
      throw Exception('Failed to load categories');
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}