import 'package:firebase_app/models/user.dart';
import 'package:firebase_app/pages/auth/authenticate.dart';
import 'package:firebase_app/pages/home/home_demande.dart';
import 'package:firebase_app/pages/home/home_offre.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:firebase_app/pages/home/home.dart';
import 'package:provider/provider.dart';

/*class Wrappe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);

    //return home or auth
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}*/

class Wrappper extends StatefulWidget {
  @override
  _WrappperState createState() => _WrappperState();
}

class _WrappperState extends State<Wrappper> {
  bool isAuth = false;
  @override
  void initState() {
    _checkIfLoggedIn();
    super.initState();
  }

  void _checkIfLoggedIn() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    if (token != null) {
      setState(() {
        isAuth = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!isAuth) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
