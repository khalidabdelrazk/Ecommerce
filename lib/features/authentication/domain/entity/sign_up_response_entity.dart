class SignUpResponseEntity {
  String? message;
  UserResponseEntity? user;
  String? token;
  ErrorResponseEntity? errors;

  SignUpResponseEntity({this.message, this.user, this.token, this.errors});

  factory SignUpResponseEntity.fromJson(Map<String, dynamic> json) {
    return SignUpResponseEntity(
      message: json['message'],
      user: json['user'] != null ? UserResponseEntity.fromJson(json['user']) : null,
      token: json['token'],
      errors: json['errors'] != null ? ErrorResponseEntity.fromJson(json['errors']) : null,
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
class ErrorResponseEntity {
  String? msg;
  String? param;
  String? location;

  ErrorResponseEntity({this.msg, this.param, this.location});

  factory ErrorResponseEntity.fromJson(Map<String, dynamic> json) {
    return ErrorResponseEntity(
      msg: json['msg'],
      param: json['param'],
      location: json['location'],
    );
  }
}