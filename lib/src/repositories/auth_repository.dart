/** 
import '../models/user/user_model.dart';  // Import model User để return dữ liệu người dùng
import '../service/api_client.dart';  // Import ApiClient (lớp này gọi API thực tế)

class AuthRepository {
  final ApiClient apiClient;

  AuthRepository(this.apiClient);

  Future<UserModel> login(String identifier, String password) {
    return apiClient.loginUser({
      "email": identifier,
      "password": password,
    });
  }
}
*/

import '../models/user/user_model.dart';  // Import model User để return dữ liệu người dùng
import '../service/api_client.dart';  // Import ApiClient (lớp này gọi API thực tế)

class AuthRepository {
  final ApiClient apiClient;

  AuthRepository(this.apiClient);

  Future<UserModel> login(String email, String password) async {
    final response = await apiClient.post('/users/login_user', data: {
      'email': email,
      'password': password,
    });

    if (response.statusCode == 200) {
      return UserModel.fromJson(response.data);
    } else {
      throw Exception('Login failed');
    }
  }
}
