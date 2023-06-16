import 'dart:convert';

class UserModel {
  int userId;
  String userToken;
  String userEmail;
  String userName;

  UserModel({
    required this.userId,
    required this.userToken,
    required this.userName,
    required this.userEmail,
  });

  Map<String, dynamic> toMap() {
    return {
      'id_user': userId,
      'token': userToken,
      'user_email': userEmail,
      'user_name': userName,
    };
  }

  // specifically for getx updating model
  static updateModel(UserModel user, dynamic profile) {
    if (profile['id_user'] != null && profile['id_user'] != 0) {
      user.userId = profile['id_user'];
    }
    if (profile['token'] != null && profile['token'] != '') {
      user.userToken = profile['token'];
    }
    if (profile['user_email'] != null && profile['user_email'] != '') {
      user.userEmail = profile['user_email'];
    }
    if (profile['user_name'] != null && profile['user_name'] != '') {
      user.userEmail = profile['user_name'];
    }
  }

  String toJson() => json.encode(toMap());
}
