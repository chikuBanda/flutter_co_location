import 'package:cloud_firestore/cloud_firestore.dart';

class Demande {
  int numero_tel;
  double budget_max;
  String commentaire;
  final DocumentReference reference;

  Demande({numero_tel, this.budget_max, this.commentaire, this.reference});

  Demande.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['numero_tel'] != null),
        assert(map['budget_max'] != null),
        assert(map['commentaire'] != null),
        numero_tel = map['numero_tel'],
        budget_max = map['budget_max'].toDouble(),
        commentaire = map['commentaire'];

  Demande.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);
}
