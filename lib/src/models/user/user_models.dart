int _currentCustomerId = 1; 

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
  }) : customerId = _currentCustomerId++, 
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

    data.removeWhere((key, value) => value == null || value == "");
    return data;
  }
}
