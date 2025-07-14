
import 'package:ecommerce/features/authentication/domain/entity/sign_up_response_entity.dart';

class SignUpResponseDm extends SignUpResponseEntity {

  SignUpResponseDm({super.message, super.user, super.token});

  SignUpResponseDm.fromJson(Map<String, dynamic> json) {
    if(json["message"] is String) {
      message = json["message"];
    }
    if(json["user"] is Map) {
      user = json["user"] == null ? null : UserResponseDm.fromJson(json["user"]);
    }
    if(json["token"] is String) {
      token = json["token"];
    }
  }
}

// ignore: non_constant_identifier_names
class UserResponseDm extends UserResponseEntity {

  UserResponseDm({super.name, super.email, super.role});

  UserResponseDm.fromJson(Map<String, dynamic> json) {
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["email"] is String) {
      email = json["email"];
    }
    if(json["role"] is String) {
      role = json["role"];
    }
  }

  static List<UserResponseDm> fromList(List<Map<String, dynamic>> list) {
    return list.map(UserResponseDm.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["name"] = name;
    _data["email"] = email;
    _data["role"] = role;
    return _data;
  }
}