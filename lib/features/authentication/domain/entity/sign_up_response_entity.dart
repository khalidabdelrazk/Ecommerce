class SignUpResponseEntity {
  String? message;
  UserResponseEntity? user;
  String? token;

  SignUpResponseEntity({this.message, this.user, this.token});

  factory SignUpResponseEntity.fromJson(Map<String, dynamic> json) {
    return SignUpResponseEntity(
      message: json['message'],
      user: json['user'] != null ? UserResponseEntity.fromJson(json['user']) : null,
      token: json['token'],
    );
  }
}

class UserResponseEntity {
  String? name;
  String? email;
  String? role;

  UserResponseEntity({this.name, this.email, this.role});

  factory UserResponseEntity.fromJson(Map<String, dynamic> json) {
    return UserResponseEntity(
      name: json['name'],
      email: json['email'],
      role: json['role'],
    );
  }
}
