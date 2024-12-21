import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

part 'rest_service.g.dart';

@RestApi(baseUrl: 'https://api-core.dsp.one')
abstract class RestService {
  factory RestService(Dio dio, {String? baseUrl}) = _RestService;

  //token này cần lấy sau thực hiện login, không dùng các token cũ
  @GET('/api/auth/notify/template')
  Future<dynamic> getNotify(
    @Query('page') int page,
    @Query('per_page') int perPage,
    @Header('Authorization') String token,
  );
}
