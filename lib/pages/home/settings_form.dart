import 'package:flutter/material.dart';
import 'package:firebase_app/shared/constants.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2'];

  String _currentName;
  String _currentSugars;
  int _currentStrength;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Text(
            'update your brew settings',
            style: TextStyle(fontSize: 18.0),
          ),

          TextFormField(
            decoration: textInputDecoration,
            validator: (val) => val.isEmpty ? 'Please enter a name' : null,
            onChanged: (val) => setState(() => _currentName = val),
          ),

          //dropdown
          DropdownButtonFormField(
            decoration: textInputDecoration,
            items: sugars.map((sugar) {
              return DropdownMenuItem(
                value: sugar,
                child: Text('$sugar sugars'),
              );
            }).toList(),
            onChanged: (String value) {
              setState(() {
                _currentSugars = value;
              });
            },
          ),
          //slider
          Slider(
            min: 100,
            max: 900,
            divisions: 8,
            onChanged: (val) {
              setState(() {
                _currentStrength = val.round();
              });
            },
            value: (_currentStrength ?? 100).toDouble(),
          ),

          RaisedButton(
              color: Colors.pink[400],
              child: Text(
                'update',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () async {
                print(_currentName);
                print(_currentSugars);
                print(_currentStrength);
              })
        ],
      ),
    );
  }
}
