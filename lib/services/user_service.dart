import 'dart:convert';

import 'package:firebase_app/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  Future<User> getCurrentUser() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    String userString = localStorage.getString('user');
    Map<String, dynamic> userJson = jsonDecode(jsonDecode(userString));
    User user = User.fromJson(userJson);

    return user;
  }
}
