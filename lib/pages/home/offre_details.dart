import 'package:firebase_app/models/demande.dart';
import 'package:firebase_app/models/offre.dart';
import 'package:flutter/material.dart';

class DetailOffre extends StatelessWidget {
  final Offre offre;

  DetailOffre({Key key, @required this.offre}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demande'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(offre.adresse.toString()),
      ),
    );
  }
}
