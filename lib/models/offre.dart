import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Offre {
  String adresse;
  double superficie;
  double prix;
  int capacite;
  int wifi;
  int lavage_ligne;
  int climatisation;
  double cordx;
  double cordy;
  int user_id;

  final DocumentReference reference;

  Offre(
      {this.adresse,
      this.superficie,
      this.prix,
      this.capacite,
      this.reference,
      this.lavage_ligne,
      this.wifi,
      this.climatisation,
      this.cordx,
      this.cordy,
      this.user_id});

  Offre.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['adresse'] != null),
        assert(map['superficie'] != null),
        assert(map['prix'] != null),
        assert(map['capacite'] != null),
        adresse = map['adresse'],
        superficie = map['superficie'].toDouble(),
        prix = map['prix'].toDouble(),
        capacite = map['capacite'],
        wifi = map['wifi'],
        lavage_ligne = map['lavage_ligne'],
        climatisation = map['climatisation'],
        cordx = map['cordx'].toDouble(),
        cordy = map['cordy'].toDouble(),
        user_id = map['user_id'];

  Offre.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  factory Offre.fromJson(Map<String, dynamic> json) {
    return Offre(
      adresse: json['adresse'] as String,
      superficie: json['superficie'].toDouble(),
      prix: json['prix'].toDouble(),
      capacite: json['capacite'] as int,
      wifi: json['wifi'] as int,
      lavage_ligne: json['lavage_ligne'] as int,
      climatisation: json['climatisation'] as int,
      cordx: json['cordx'].toDouble(),
      cordy: json['cordy'].toDouble(),
      user_id: json['user_id'] as int,
    );
  }
}
