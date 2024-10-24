// lib/retrofit/api_client.dart

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import './modul/category.dart'; // Đảm bảo bạn đã import đúng đường dẫn

part 'api_client.g.dart'; // Tệp này sẽ được tự động tạo ra

@RestApi(baseUrl: "https://trip-aura-server.vercel.app/category/")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET("api/getCategory") // Đường dẫn đến API
  Future<CategoryResponse> getData(); // Thay đổi ResponseType thành CategoryResponse
}
