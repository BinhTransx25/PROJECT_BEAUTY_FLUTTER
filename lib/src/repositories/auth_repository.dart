/** */
import '../models/user/user_model.dart';  // Import model User để return dữ liệu người dùng
import '../service/api_client.dart';  // Import ApiClient (lớp này gọi API thực tế)

class AuthRepository {
  final ApiClient apiClient;

  AuthRepository(this.apiClient);

  Future<UserModel> login(String email, String password) {
    return apiClient.loginUser({
      "email": email,
      "password": password,
    });
  }
}
