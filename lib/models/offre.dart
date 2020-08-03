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

  Offre(
      {this.adresse,
      this.superficie,
      this.prix,
      this.capacite,
      this.lavage_ligne,
      this.wifi,
      this.climatisation,
      this.cordx,
      this.cordy,
      this.user_id});

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
