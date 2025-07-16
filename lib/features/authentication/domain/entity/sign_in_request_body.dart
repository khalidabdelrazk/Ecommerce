class SignInRequestBody {
  final String email;
  final String password;

  SignInRequestBody({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}