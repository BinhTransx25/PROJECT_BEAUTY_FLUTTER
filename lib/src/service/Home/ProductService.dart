import 'package:dio/dio.dart';
import '../../models/home/ProductModel.dart';

class ProductService {
  final Dio _dio = Dio();
  static const String baseUrl = 'https://api-core.dsp.one/api/auth/product';

  Future<ProductResponse> getProducts() async {
    try {
      final response = await _dio.get(baseUrl);
      
      if (response.statusCode == 200) {
        return ProductResponse.fromJson(response.data);
      } else {
        throw DioException(
          requestOptions: RequestOptions(path: baseUrl),
          message: 'Failed to load products',
        );
      }
    } on DioException catch (e) {
      throw Exception('Error fetching products: ${e.message}');
    }
  }
}