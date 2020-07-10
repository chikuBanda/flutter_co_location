import 'package:firebase_app/pages/auth/authenticate.dart';
import 'package:flutter/material.dart';

import 'package:firebase_app/pages/home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //return home or auth
    return Authenticate();
  }
}
