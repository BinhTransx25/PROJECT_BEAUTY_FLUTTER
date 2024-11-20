int _currentCustomerId = 1; // Biến toàn cục, lưu ID hiện tại

class UserRequest {
  final String name;
  final String nickName;
  final String email;
  final String address;
  final String phone;
  final String password;
  final String passwordConfirmation;
  final int customerId;

  UserRequest({
    required this.email,
    required this.phone,
    required this.password,
    this.name = "N/A",
    this.nickName = "N/A",
    this.address = "N/A",
    required this.passwordConfirmation,
  }) : customerId = _currentCustomerId++, // Tự động tăng ID
       assert(email != null),
       assert(phone != null),
       assert(password != null),
       assert(passwordConfirmation != null);

  Map<String, dynamic> toJson() {
    final data = {
      'name': name,
      'nick_name': nickName,
      'email': email,
      'address': address,
      'phone': phone,
      'password': password,
      'password_confirmation': passwordConfirmation,
      'customer_id': customerId,
    };

    // Loại bỏ các trường có giá trị rỗng
    data.removeWhere((key, value) => value == null || value == "");
    return data;
  }
}
