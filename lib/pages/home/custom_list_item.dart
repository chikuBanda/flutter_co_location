import 'package:firebase_app/models/offre.dart';
import 'package:firebase_app/pages/home/offre_details.dart';
import 'package:flutter/material.dart';
import 'package:firebase_app/pages/home/offre_description.dart';

class CustomListItem extends StatelessWidget {
  CustomListItem({
    Key key,
    this.thumbnail,
    this.adresse,
    this.prix,
    this.capacite,
    this.superficie,
    this.offre,
  }) : super(key: key);

  final Widget thumbnail;
  final String adresse;
  final double prix;
  final int capacite;
  final double superficie;
  final Offre offre;

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
                builder: (context) => DetailOffre(offre: offre),
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
                      child: OffreDescription(
                        adresse: adresse,
                        prix: prix,
                        superficie: superficie,
                        capacite: capacite,
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
