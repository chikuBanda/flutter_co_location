import 'package:firebase_app/models/user.dart';
import 'package:firebase_app/pages/auth/authenticate.dart';
import 'package:flutter/material.dart';

import 'package:firebase_app/pages/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
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
}
