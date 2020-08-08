import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
//import 'package:latlng/latlng.dart';
import 'package:latlong/latlong.dart';

class Carte extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new FlutterMap(
        options: new MapOptions(
          center: new LatLng(32.343504, -6.3609538),
          zoom: 16.0,
        ),
        layers: [
          new TileLayerOptions(
              urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              subdomains: ['a', 'b', 'c']),
          new MarkerLayerOptions(
            markers: [
              new Marker(
                width: 20.0,
                height: 20.0,
                point: new LatLng(32.343927, -6.360257),
                builder: (ctx) => new Container(
                  child: Icon(Icons.location_on),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
