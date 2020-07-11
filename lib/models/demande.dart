import 'package:cloud_firestore/cloud_firestore.dart';

class Demande {
  double cordx;
  double cordy;
  double budget_max;
  String commentaire;
  final DocumentReference reference;

  Demande(
      {this.cordx,
      this.cordy,
      this.budget_max,
      this.commentaire,
      this.reference});

  Demande.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['cordx'] != null),
        assert(map['cordy'] != null),
        assert(map['budget_max'] != null),
        assert(map['commentaire'] != null),
        cordx = map['cordx'].toDouble(),
        cordy = map['cordy'].toDouble(),
        budget_max = map['budget_max'].toDouble(),
        commentaire = map['commentaire'];

  Demande.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);
}
