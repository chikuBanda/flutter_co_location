import 'package:firebase_app/pages/home/home_demande.dart';
import 'package:firebase_app/pages/home/home_offre.dart';
import 'package:firebase_app/pages/home/map.dart';
import 'package:firebase_app/pages/home/settings_form.dart';
import 'package:firebase_app/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geocoder/geocoder.dart';
import "package:latlong/latlong.dart";
import 'package:latlong/latlong.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _authService = new AuthService();

  int _selectedItem = 0;

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
            label: Text('logout'),
            onPressed: () async {
              await _authService.signOut();
            },
          ),
        ],
      ),
      body: pageWidgets(_selectedItem),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            title: Text('Business'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            title: Text('School'),
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
}
