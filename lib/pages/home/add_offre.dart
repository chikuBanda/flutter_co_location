import 'dart:convert';

import 'package:firebase_app/models/cordinate.dart';
import 'package:firebase_app/models/user.dart';
import 'package:firebase_app/pages/home/map_dialog.dart';
import 'package:firebase_app/services/offres_service.dart';
import 'package:firebase_app/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:firebase_app/shared/constants.dart';
import 'package:firebase_app/shared/loading.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:nominatim_location_picker/nominatim_location_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddOffre extends StatefulWidget {
  @override
  _AddOffreState createState() => _AddOffreState();
}

class _AddOffreState extends State<AddOffre> {
  final OffreService offreService = new OffreService();

  final formKey = GlobalKey<FormState>();
  bool loading = false;

  // textfield state
  double prix;
  double superficie;
  int capacite;
  String adresse = '';
  double cordx;
  double cordy;
  bool wifi = false;
  bool climatisation = false;
  bool lavage_ligne = false;
  String error = '';
  int user_id;

  UserService userService = new UserService();

  @override
  void initState() {
    _loadUserData();
    super.initState();
  }

  _loadUserData() async {
    User user = await userService.getCurrentUser();

    if (user != null) {
      setState(() {
        user_id = user.id;
      });
    }
  }

  Widget getLocationWithMapBox() {
    return MapBoxLocationPicker(
      popOnSelect: true,
      apiKey:
          "pk.eyJ1IjoiY2hpa3ViYW5kYSIsImEiOiJja2Jjc3lvMWMwNTQ5MnpsOXFlNDdxM3lhIn0.5xx4cVmEj0dUjqtEprnk1Q",
      limit: 10,
      language: 'pt',
      country: 'br',
      searchHint: 'Pesquisar',
      awaitingForLocation: "Procurando por sua localização",
      customMapLayer: TileLayerOptions(
          urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
          subdomains: ['a', 'b', 'c']),
      onSelected: (place) {
        setState(() {
          adresse = place.placeName;
          cordx = place.geometry.coordinates[0];
          cordy = place.geometry.coordinates[1];

          print(adresse);
          print(cordx);
          print(cordy);
        });
      },
      context: context,
    );
  }

  RaisedButton mapBoxButton(Color color, String name) {
    return RaisedButton(
      color: color,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => getLocationWithMapBox()),
        );
      },
      textColor: Colors.white,
      child: Center(
        child: Text(name),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
    );
  }

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
              title: Text('Nouveau Offre'),
              actions: [],
            ),
            body: Container(
              padding: EdgeInsets.all(10.0),
              child: Form(
                key: formKey,
                child: Container(
                  padding: EdgeInsets.all(20.0),
                  child: ListView(
                    children: [
                      SizedBox(height: 20.0),
                      TextFormField(
                        decoration:
                            textInputDecoration.copyWith(hintText: 'Prix'),
                        onChanged: (val) {
                          setState(() => prix = double.parse(val));
                        },
                        /*validator: (val) => val.length < 6
                            ? 'Enter a password 6+ characters'
                            : null,*/
                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                        decoration:
                            textInputDecoration.copyWith(hintText: 'Capacite'),
                        onChanged: (val) {
                          setState(() => capacite = int.parse(val));
                        },
                        /*validator: (val) => val.length < 6
                            ? 'Enter a password 6+ characters'
                            : null,*/
                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                        decoration: textInputDecoration.copyWith(
                            hintText: 'Superficie'),
                        onChanged: (val) {
                          setState(() => superficie = double.parse(val));
                        },
                        /*validator: (val) => val.length < 6
                            ? 'Enter a password 6+ characters'
                            : null,*/
                      ),

                      SizedBox(height: 20.0),
                      CheckboxListTile(
                        title: Text("Wifi"),
                        value: wifi,
                        onChanged: (newValue) {
                          setState(() {
                            wifi = newValue;
                          });
                        },
                        controlAffinity: ListTileControlAffinity
                            .leading, //  <-- leading Checkbox
                      ),
                      SizedBox(height: 20.0),
                      CheckboxListTile(
                        title: Text("Lavage ligne"),
                        value: lavage_ligne,
                        onChanged: (newValue) {
                          setState(() {
                            lavage_ligne = newValue;
                          });
                        },
                        controlAffinity: ListTileControlAffinity
                            .leading, //  <-- leading Checkbox
                      ),
                      SizedBox(height: 20.0),
                      CheckboxListTile(
                        title: Text("Climatisation"),
                        value: climatisation,
                        onChanged: (newValue) {
                          setState(() {
                            climatisation = newValue;
                          });
                        },
                        controlAffinity: ListTileControlAffinity
                            .leading, //  <-- leading Checkbox
                      ),

                      /*RaisedButton.icon(
                        onPressed: () {
                          openDialog();
                        },
                        icon: Icon(Icons.add_location),
                        label: Text('Ajouter adresse'),
                      ),*/

                      //nominatimButton(Colors.blue, 'location picker'),
                      mapBoxButton(Colors.red, 'location picker'),
                      SizedBox(height: 20.0),
                      RaisedButton(
                        color: Colors.pink[400],
                        child: Text(
                          'Ajouter Offre',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () async {
                          // if (formKey.currentState.validate()) {
                          //   setState(() => loading = true);
                          //   dynamic result = await _authService
                          //       .signInWithEmailAndPassword(email, password);
                          //   if (result == null) {
                          //     setState(() {
                          //       error = 'Invalid credentials';
                          //       loading = false;
                          //     });
                          //   }
                          // }
                          /*offresCollection.document().setData({
                            'prix': prix,
                            'adresse': adresse,
                            'capacite': capacite,
                            'superficie': superficie
                          });*/

                          offreService.createOffre(
                            prix: prix,
                            adresse: adresse,
                            capacite: capacite,
                            superficie: superficie,
                            wifi: wifi,
                            lavage_ligne: lavage_ligne,
                            climatisation: climatisation,
                            cordx: cordx,
                            cordy: cordy,
                            user_id: user_id,
                          );

                          Navigator.pop(context);
                        },
                      ),
                      SizedBox(height: 12.0),
                      Text(error,
                          style: TextStyle(color: Colors.red, fontSize: 14.0))
                    ],
                  ),
                ),
              ),
            ),
          );
  }

  Future openDialog() async {
    Cordinate cord =
        await Navigator.of(context).push(new MaterialPageRoute<Cordinate>(
            builder: (BuildContext context) {
              return new MapDialog();
            },
            fullscreenDialog: true));

    if (cord != null) {
      print(cord.lat);
    }
  }
}
