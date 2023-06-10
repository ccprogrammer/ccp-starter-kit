import 'dart:convert';

class UserModel {
  int userId;
  String userToken;
  String userName;
  String userFullName;
  String userEmail;
  String userPhone;
  String userAddress;
  String userDateOfBirth;
  int userAge;
  String userPhoto;

  UserModel({
    required this.userId,
    required this.userToken,
    required this.userName,
    required this.userFullName,
    required this.userEmail,
    required this.userPhone,
    required this.userAddress,
    required this.userDateOfBirth,
    required this.userAge,
    required this.userPhoto,
  });

  Map<String, dynamic> toMap() {
    return {
      'id_user': userId,
      'token': userToken,
      'user_name': userName,
      'user_full_name': userFullName,
      'user_email': userEmail,
      'user_phone': userPhone,
      'user_address': userAddress,
      'user_date_of_birth': userDateOfBirth,
      'user_age': userAge,
      'user_photo': userPhoto,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userId: map['id_user']?.toInt() ?? 0,
      userToken: map['token'] ?? '',
      userName: map['user_name'] ?? '',
      userFullName: map['user_full_name'] ?? '',
      userEmail: map['user_email'] ?? '',
      userPhone: map['user_phone'] ?? '',
      userAddress: map['user_address'] ?? '',
      userDateOfBirth: map['user_date_of_birth'] ?? '',
      userAge: map['user_age']?.toInt() ?? 0,
      userPhoto: map['user_photo'] ?? '',
    );
  }

  // specifically for getx updating model
  static updateModel(UserModel user, dynamic profile) {
    if (profile['id_user'] != null && profile['id_user'] != 0) {
      user.userId = profile['id_user'] ?? 0;
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
    if (profile['user_full_name'] != null && profile['user_full_name'] != '') {
      user.userEmail = profile['user_full_name'];
    }
    if (profile['user_photo'] != null && profile['user_photo'] != '') {
      user.userEmail = profile['user_photo'];
    }
    if (profile['user_phone'] != null && profile['user_phone'] != '') {
      user.userEmail = profile['user_phone'];
    }
    if (profile['user_address'] != null && profile['user_address'] != '') {
      user.userEmail = profile['user_address'];
    }
    if (profile['user_date_of_birth'] != null &&
        profile['user_date_of_birth'] != '') {
      user.userEmail = profile['user_date_of_birth'];
    }
    if (profile['user_age'] != null && profile['user_age'] != 0) {
      user.userEmail = profile['user_age'];
    }
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
