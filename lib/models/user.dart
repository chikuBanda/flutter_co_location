import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class User {
  int id;
  String name;
  String email;
  String password;

  User({this.id, this.email, this.name, this.password});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'] as int,
        name: json['name'] as String,
        email: json['email'] as String,
        password: json['password'] as String);
  }

  @override
  String toString() {
    return super.toString();
  }
}
