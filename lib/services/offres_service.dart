import 'dart:convert';

import 'package:firebase_app/models/offre.dart';
import 'package:http/http.dart';

class OffreService {
  final String offresURL = "http://192.168.1.16:8000/api/offres";

  Future<List<Offre>> getEvents() async {
    Response res = await get(offresURL);
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
}
