import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import '../../src/models/user/user_model.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "http://localhost:9999")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @POST("/users/login_user")
  Future<UserModel> loginUser(@Body() Map<String, String> credentials);
}


