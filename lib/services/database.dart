import 'package:cloud_firestore/cloud_firestore.dart';
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

  // demande list from snapshot
  List<Demande> _demandeListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Demande(
        numero_tel: doc.data['cordy'] ?? 0.0,
        budget_max: doc.data['budget_max'] ?? 0.0,
        commentaire: doc.data['commentaire'] ?? '',
      );
    }).toList();
  }

  //get demandes stream
  Stream<List<Demande>> get demandes {
    return demandeCollection.snapshots().map(_demandeListFromSnapshot);
  }
}
