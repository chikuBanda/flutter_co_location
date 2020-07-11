import 'package:firebase_app/models/demande.dart';
import 'package:flutter/material.dart';

class DetailDemande extends StatelessWidget {
  final Demande demande;

  DetailDemande({Key key, @required this.demande}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demande'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(demande.budget_max.toString()),
      ),
    );
  }
}
