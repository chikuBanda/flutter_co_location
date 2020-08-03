import 'package:firebase_app/models/demande.dart';
import 'package:firebase_app/models/offre.dart';
import 'package:flutter/material.dart';

class DetailOffre extends StatelessWidget {
  final Offre offre;

  DetailOffre({Key key, @required this.offre}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Offre'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          Container(
            child: Center(
              child: Image.network(
                'https://i.picsum.photos/id/1059/7360/4912.jpg?hmac=vVWk1qyiXN_VgPhpNqFm3yl2HUPW6fHqYOjTHYO2bHQ',
                width: 500.0,
                height: 300.0,
              ),
            ),
            padding: EdgeInsets.symmetric(vertical: 0.0),
          ),
          SizedBox(height: 5.0),
          Container(
            width: 500.0,
            child: Center(
              child: Text(
                offre.adresse,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            padding: EdgeInsets.symmetric(vertical: 0.0),
          ),
          SizedBox(height: 20.0),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            child: Card(
              child: Container(
                height: 80,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text('Prix'),
                          SizedBox(height: 20.0),
                          Text(
                            '${offre.prix.toString()} dh',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            'dh',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 30.0),
                      Column(
                        children: [
                          Text('Capacite'),
                          SizedBox(height: 20.0),
                          Text(
                            '${offre.capacite.toString()}',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            'personne(s)',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 30.0),
                      Column(
                        children: [
                          Text('Superficie'),
                          SizedBox(height: 20.0),
                          Text(
                            '${offre.superficie.toString()}',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            'm\u00B2',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 30.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 70),
            child: Center(
              child: Column(
                children: [
                  offre.wifi == 1
                      ? Row(
                          children: [
                            Icon(
                              Icons.wifi,
                              color: Colors.lightBlue,
                            ),
                            SizedBox(width: 5.0),
                            Text('Wifi')
                          ],
                        )
                      : SizedBox(height: 0.0),
                  offre.wifi == 1
                      ? SizedBox(height: 15.0)
                      : SizedBox(height: 0.0),
                  offre.lavage_ligne == 1
                      ? Row(
                          children: [
                            Icon(
                              Icons.add_a_photo,
                              color: Colors.lightBlue,
                            ),
                            SizedBox(width: 5.0),
                            Text('Lavage ligne')
                          ],
                        )
                      : SizedBox(height: 0.0),
                  offre.lavage_ligne == 1
                      ? SizedBox(height: 15.0)
                      : SizedBox(height: 0.0),
                  offre.climatisation == 1
                      ? Row(
                          children: [
                            Icon(
                              Icons.add_location,
                              color: Colors.lightBlue,
                            ),
                            SizedBox(width: 5.0),
                            Text('Climatisation')
                          ],
                        )
                      : SizedBox(height: 0.0),
                  SizedBox(height: 25.0),
                  RaisedButton.icon(
                    label: Text('Appeler'),
                    icon: Icon(Icons.call),
                    onPressed: () {},
                  ),
                  RaisedButton.icon(
                    label: Text('Message'),
                    icon: Icon(Icons.message),
                    onPressed: () {},
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
