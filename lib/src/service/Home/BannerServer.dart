import 'package:dio/dio.dart';
import '../../models/home/Banner.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<List<BannerModel>> fetchBanners() async {
    try {
      final response =
          await _dio.get('https://api-core.dsp.one/api/auth/banner');

      if (response.statusCode == 200) {
        final responseData = response.data;
        if (responseData is Map<String, dynamic> &&
            responseData.containsKey('data')) {
          List bannersJson = responseData['data']; 
          return bannersJson
              .where((item) => item['is_active'] == true) 
              .map(
                  (item) => BannerModel.fromJson(item)) 
              .toList();
        } else {
          throw Exception('Unexpected data format');
        }
      } else {
        throw Exception('Failed to load banners');
      }
    } catch (e) {
      print('Error fetching banners: $e');
      throw Exception('Error fetching banners: $e');
    }
  }
}
