import 'dart:convert';

import 'package:firebase_app/pages/auth/authenticate.dart';
import 'package:firebase_app/pages/auth/sign_in.dart';
import 'package:firebase_app/pages/home/home_demande.dart';
import 'package:firebase_app/pages/home/home_offre.dart';
import 'package:firebase_app/pages/home/map.dart';
import 'package:firebase_app/pages/home/settings_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geocoder/geocoder.dart';
import "package:latlong/latlong.dart";
import 'package:latlong/latlong.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedItem = 0;
  String username = '';

  @override
  void initState() {
    _loadUserData();
    super.initState();
  }

  _loadUserData() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var user = jsonDecode(localStorage.getString('user'));

    if (user != null) {
      setState(() {
        username = user;
      });
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedItem = index;
    });
  }

  Widget pageWidgets(int index) {
    List<Widget> _widgetOptions = <Widget>[
      HomeOffre(),
      HomeDemande(),
      Carte(),
    ];

    return _widgetOptions[index];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        actions: [
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('$username'),
            onPressed: () async {
              _logout();
              //await _authService.signOut();
            },
          ),
        ],
      ),
      body: pageWidgets(_selectedItem),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Offres'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            title: Text('Demandes'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            title: Text('Carte'),
          ),
        ],
        currentIndex: _selectedItem,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
      /*Column(
          children: [
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
        )*/
    );
  }

  void _logout() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    localStorage.remove('token');
    localStorage.remove('user');
    print('user: ${localStorage.get("user")}');
    print('token: ${localStorage.get("token")}');
    Navigator.push(
      context,
      new MaterialPageRoute(builder: (context) => Authenticate()),
    );
  }
}
