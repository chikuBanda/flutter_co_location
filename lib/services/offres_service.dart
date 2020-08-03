import 'dart:convert';

import 'package:firebase_app/models/offre.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class OffreService {
  final String offresURL = "http://192.168.1.7:8000/api/offres";

  Future<List<Offre>> getEvents() async {
    http.Response res = await http.get(offresURL);
    if (res.statusCode == 200) {
      print('---------------1-------------------');
      print(res.body);
      Map<String, dynamic> body = jsonDecode(res.body);
      List data = body['data'];
      print('----------2-----------');
      List<Offre> posts =
          data.map((dynamic item) => Offre.fromJson(item)).toList();
      print('-------3--------------');
      return posts;
    } else {
      throw "Can't get events.";
    }
  }

  Future<http.Response> createOffre(
      {String adresse,
      double superficie,
      double prix,
      int capacite,
      bool wifi,
      bool lavage_ligne,
      bool climatisation,
      double cordx,
      double cordy,
      int user_id}) {
    int wifi_val = 0;
    int lavage_ligne_val = 0;
    int climatisation_val = 0;

    if (wifi) {
      wifi_val = 1;
    }

    if (lavage_ligne) {
      lavage_ligne_val = 1;
    }

    if (climatisation) {
      climatisation_val = 1;
    }

    return http.post(
      offresURL,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'adresse': adresse,
        'superficie': superficie,
        'prix': prix,
        'capacite': capacite,
        'wifi': wifi_val,
        'lavage_ligne': lavage_ligne_val,
        'climatisation': climatisation_val,
        'cordx': cordx,
        'cordy': cordy,
        'user_id': user_id,
      }),
    );
  }
}
