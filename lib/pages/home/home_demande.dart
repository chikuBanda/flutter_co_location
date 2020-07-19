import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/models/demande.dart';
import 'package:firebase_app/pages/home/add_demande.dart';
import 'package:firebase_app/pages/home/custom_list_item_demande.dart';
import 'package:firebase_app/pages/home/demande_details.dart';
import 'package:firebase_app/services/auth.dart';
import 'package:firebase_app/services/demandes_services.dart';
import 'package:flutter/material.dart';

class HomeDemande extends StatelessWidget {
  final AuthService _authService = new AuthService();
  final CollectionReference demandeCollection =
      Firestore.instance.collection('demandes');
  final DemandeService demandeService = new DemandeService();

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
              builder: (context) => AddDemande(),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return FutureBuilder(
      future: demandeService.getDemandes(),
      builder: (context, AsyncSnapshot<List<Demande>> snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();

        return _buildList(context, snapshot.data);
      },
    );
  }

  Widget _buildList(BuildContext context, List<Demande> demandes) {
    return ListView(
      padding: const EdgeInsets.only(top: 20.0),
      children:
          demandes.map((demande) => _buildListItem(context, demande)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, Demande demande) {
    final record = demande;

    return Padding(
      //key: ValueKey(record.name),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        child: CustomListItemDemande(
          thumbnail: Container(
            width: 400,
            height: 400,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: NetworkImage('https://picsum.photos/250?image=9'),
                  fit: BoxFit.fill),
            ),
          ),
          commentaire: record.commentaire,
          budget_max: record.budget_max,
          numero_tel: record.numero_tel,
        ),
      ),
    );
  }
}
