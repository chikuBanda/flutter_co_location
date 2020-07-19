import 'dart:convert';

import 'package:firebase_app/pages/home/home.dart';
import 'package:firebase_app/services/authentication.dart';
import 'package:flutter/material.dart';
import 'package:firebase_app/services/auth.dart';
import 'package:firebase_app/shared/constants.dart';
import 'package:firebase_app/shared/loading.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Register extends StatefulWidget {
  final Function toggleView;

  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _authService = new AuthService();
  final formKey = GlobalKey<FormState>();
  bool loading = false;

  // textfield state
  String email = '';
  String password = '';
  String c_password = '';
  String name = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            resizeToAvoidBottomPadding: false,
            backgroundColor: Colors.brown[100],
            appBar: AppBar(
              backgroundColor: Colors.brown[400],
              elevation: 0.0,
              title: Text('Sign up to the app'),
              actions: [
                FlatButton.icon(
                  icon: Icon(Icons.person),
                  label: Text('Sign in'),
                  onPressed: () {
                    widget.toggleView();
                  },
                )
              ],
            ),
            body: Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    SizedBox(height: 20.0),
                    TextFormField(
                      decoration:
                          textInputDecoration.copyWith(hintText: 'Name'),
                      onChanged: (val) {
                        setState(() => name = val);
                      },
                      validator: (val) => val.isEmpty ? 'Enter a name' : null,
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      decoration:
                          textInputDecoration.copyWith(hintText: 'Email'),
                      onChanged: (val) {
                        setState(() => email = val);
                      },
                      validator: (val) => val.isEmpty ? 'Enter an email' : null,
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      decoration:
                          textInputDecoration.copyWith(hintText: 'Password'),
                      obscureText: true,
                      onChanged: (val) {
                        setState(() => password = val);
                      },
                      validator: (val) => val.length < 6
                          ? 'Enter a password 6+ characters'
                          : null,
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      decoration: textInputDecoration.copyWith(
                          hintText: 'Confirm Password'),
                      obscureText: true,
                      onChanged: (val) {
                        setState(() => c_password = val);
                      },
                      validator: (val) =>
                          val != password ? 'Passwords must match' : null,
                    ),
                    SizedBox(height: 20.0),
                    RaisedButton(
                      color: Colors.pink[400],
                      child: Text(
                        'Register',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        if (formKey.currentState.validate()) {
                          setState(() {
                            loading = true;
                          });

                          _register();
                        }
                      },
                    ),
                    SizedBox(height: 12.0),
                    Text(error,
                        style: TextStyle(color: Colors.red, fontSize: 14.0))
                  ],
                ),
              ),
            ),
          );
  }

  void _register() async {
    var data = {
      'email': email,
      'password': password,
      'c_password': c_password,
      'name': name,
    };

    var res = await AuthenticationService().authData(data, '/register');
    var body = json.decode(res.body);
    if (body['success']) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', json.encode(body['data']['token']));
      localStorage.setString('user', json.encode(body['data']['name']));
      Navigator.push(
        context,
        new MaterialPageRoute(builder: (context) => Home()),
      );
    }

    setState(() {
      loading = false;
    });
  }
}
