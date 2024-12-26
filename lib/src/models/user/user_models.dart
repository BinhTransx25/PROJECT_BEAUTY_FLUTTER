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
    required this.name,
    required this.nickName,
    required this.email,
    required this.address,
    required this.phone,
    required this.password,
    required this.passwordConfirmation,
    required this.customerId,
  });
}

class OtpRequest {
  final String email;
  final String otp;

  OtpRequest({required this.email, required this.otp});

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'otp': otp,
    };
  }
}
