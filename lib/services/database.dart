import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/models/brew.dart';
import 'package:firebase_app/models/demande.dart';

class DatabaseService {
  // collection reference
  final String uid;

  DatabaseService({this.uid});

  final CollectionReference brewCollection =
      Firestore.instance.collection('brews');

  final CollectionReference demandeCollection =
      Firestore.instance.collection('demandes');

  Future updateUserData(String sugars, String name, int strength) async {
    return await brewCollection
        .document(uid)
        .setData({'sugars': sugars, 'name': name, 'strength': strength});
  }

  Future updateDemandeData(
      double cordx, double cordy, double budget_max, String commentaire) async {
    return await demandeCollection.document().setData({
      'cordx': cordx,
      'cordy': cordy,
      'budget_max': budget_max,
      'commentaire': commentaire
    });
  }

  // brew list from snapshot
  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Brew(
          name: doc.data['name'] ?? '',
          strength: doc.data['strength'] ?? 0,
          sugars: doc.data['sugars'] ?? '0');
    }).toList();
  }

  // demande list from snapshot
  List<Demande> _demandeListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Demande(
        cordx: doc.data['cordx'] ?? 0.0,
        cordy: doc.data['cordy'] ?? 0.0,
        budget_max: doc.data['budget_max'] ?? 0.0,
        commentaire: doc.data['commentaire'] ?? '',
      );
    }).toList();
  }

  //get brews stream
  Stream<List<Brew>> get brews {
    return brewCollection.snapshots().map(_brewListFromSnapshot);
  }

  //get demandes stream
  Stream<List<Demande>> get demandes {
    return demandeCollection.snapshots().map(_demandeListFromSnapshot);
  }
}
