import 'package:firebase_app/models/demande.dart';
import 'package:firebase_app/models/offre.dart';
import 'package:firebase_app/pages/home/demande_description.dart';
import 'package:firebase_app/pages/home/demande_details.dart';
import 'package:firebase_app/pages/home/offre_details.dart';
import 'package:flutter/material.dart';
import 'package:firebase_app/pages/home/offre_description.dart';

class CustomListItemDemande extends StatelessWidget {
  CustomListItemDemande({
    Key key,
    this.thumbnail,
    this.commentaire,
    this.budget_max,
    this.demande,
    this.numero_tel,
  }) : super(key: key);

  final Widget thumbnail;
  final String commentaire;
  final double budget_max;
  final int numero_tel;
  final Demande demande;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SizedBox(
        height: 100,
        child: new GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailDemande(demande: demande),
              ),
            );
          },
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 1.0,
                    child: thumbnail,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20.0, 0.0, 2.0, 0.0),
                      child: DemandeDescription(
                        numero_tel: numero_tel,
                        budget_max: budget_max,
                        commentaire: commentaire,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
