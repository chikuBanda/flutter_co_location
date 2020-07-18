import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/models/offre.dart';
import 'package:firebase_app/pages/home/add_offre.dart';
import 'package:firebase_app/pages/home/offre_details.dart';
import 'package:firebase_app/services/auth.dart';
import 'package:firebase_app/services/offres_service.dart';
import 'package:flutter/material.dart';
import 'package:firebase_app/pages/home/offre_description.dart';
import 'package:firebase_app/pages/home/custom_list_item.dart';

class HomeOffre extends StatelessWidget {
  final AuthService _authService = new AuthService();
  final CollectionReference offreCollection =
      Firestore.instance.collection('offres');
  OffreService offreService = new OffreService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.brown[50],
      body: _buildBody(context),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddOffre(),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return FutureBuilder(
      future: offreService.getEvents(),
      builder: (context, AsyncSnapshot<List<Offre>> snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();

        List<Offre> offres = snapshot.data;
        return _buildList(context, snapshot.data);
      },
    );
  }

  Widget _buildList(BuildContext context, List<Offre> offres) {
    return ListView(
      padding: const EdgeInsets.only(top: 20.0),
      children: offres.map((offre) => _buildListItem(context, offre)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, Offre offre) {
    final record = offre;

    return Padding(
      //key: ValueKey(record.name),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        child: CustomListItem(
          thumbnail: Image.network(
            'https://picsum.photos/250?image=9',
          ),
          adresse: record.adresse,
          capacite: record.capacite,
          superficie: record.superficie,
          prix: record.prix,
          offre: record,
        ),
      ),
    );
  }
}
