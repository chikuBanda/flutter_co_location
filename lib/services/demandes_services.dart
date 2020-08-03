import 'dart:convert';

import 'package:firebase_app/models/demande.dart';
import 'package:http/http.dart';

class DemandeService {
  final String offresURL = "http://192.168.1.7:8000/api/demandes";

  Future<List<Demande>> getDemandes() async {
    Response res = await get(offresURL);
    if (res.statusCode == 200) {
      print('---------------1-------------------');
      print(res.body);
      Map<String, dynamic> body = jsonDecode(res.body);
      List data = body['data'];
      print('----------2-----------');
      List<Demande> posts =
          data.map((dynamic item) => Demande.fromJson(item)).toList();
      print('-------3--------------');
      return posts;
    } else {
      throw "Can't get events.";
    }
  }
}
