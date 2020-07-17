import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/models/demande.dart';
import 'package:firebase_app/pages/home/add_demande.dart';
import 'package:firebase_app/pages/home/custom_list_item_demande.dart';
import 'package:firebase_app/pages/home/demande_details.dart';
import 'package:firebase_app/services/auth.dart';
import 'package:flutter/material.dart';

class HomeDemande extends StatelessWidget {
  final AuthService _authService = new AuthService();
  final CollectionReference demandeCollection =
      Firestore.instance.collection('demandes');

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
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('demandes').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();

        return _buildList(context, snapshot.data.documents);
      },
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      padding: const EdgeInsets.only(top: 20.0),
      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    final record = Demande.fromSnapshot(data);

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
