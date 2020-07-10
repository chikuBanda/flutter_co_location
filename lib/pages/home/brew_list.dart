import 'package:firebase_app/models/brew.dart';
import 'package:firebase_app/pages/home/brew_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BrewsList extends StatefulWidget {
  @override
  _BrewsListState createState() => _BrewsListState();
}

class _BrewsListState extends State<BrewsList> {
  @override
  Widget build(BuildContext context) {
    final brews = Provider.of<List<Brew>>(context);
    brews.forEach((brew) {
      print(brew.name);
      print(brew.sugars);
      print(brew.strength);
    });

    return ListView.builder(
      itemCount: brews.length,
      itemBuilder: (context, index) {
        return BrewTile(brew: brews[index]);
      },
    );
  }
}
