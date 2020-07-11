import 'package:firebase_app/pages/home/home_demande.dart';
import 'package:firebase_app/pages/home/home_offre.dart';
import 'package:firebase_app/pages/home/map.dart';
import 'package:firebase_app/pages/home/settings_form.dart';
import 'package:firebase_app/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final AuthService _authService = new AuthService();

  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60),
              child: SettingsForm(),
            );
          });
    }

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        actions: [
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('logout'),
            onPressed: () async {
              await _authService.signOut();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Carte(),
          RaisedButton(
            color: Colors.pink[400],
            child: Text(
              'Offres',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeOffre()),
              );
            },
          ),
          RaisedButton(
            color: Colors.pink[400],
            child: Text(
              'Demandes',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeDemande()),
              );
            },
          ),
        ],
      ),
    );
  }
}
