import 'package:flutter/material.dart';
import 'package:firebase_app/services/auth.dart';
import 'package:firebase_app/shared/constants.dart';
import 'package:firebase_app/shared/loading.dart';

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
                          dynamic result = await _authService
                              .registerWithEmailAndPassword(email, password);

                          if (result == null) {
                            setState(() {
                              error = 'Please supply a valid email';
                              loading = false;
                            });
                          }
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
}
