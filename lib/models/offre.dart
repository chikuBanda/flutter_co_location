import 'package:cloud_firestore/cloud_firestore.dart';

class Offre {
  String adresse;
  double superficie;
  double prix;
  int capacite;
  final DocumentReference reference;

  Offre(
      {this.adresse,
      this.superficie,
      this.prix,
      this.capacite,
      this.reference});

  Offre.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['adresse'] != null),
        assert(map['superficie'] != null),
        assert(map['prix'] != null),
        assert(map['capacite'] != null),
        adresse = map['adresse'],
        superficie = map['superficie'].toDouble(),
        prix = map['prix'].toDouble(),
        capacite = map['capacite'];

  Offre.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);
}
