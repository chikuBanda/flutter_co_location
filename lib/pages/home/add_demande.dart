import 'package:flutter/material.dart';
import 'package:firebase_app/shared/constants.dart';
import 'package:firebase_app/shared/loading.dart';

class AddDemande extends StatefulWidget {
  @override
  _AddDemandeState createState() => _AddDemandeState();
}

class _AddDemandeState extends State<AddDemande> {
  final formKey = GlobalKey<FormState>();
  bool loading = false;

  // textfield state
  int numero_tel;
  double budget_max;
  String commentaire = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            resizeToAvoidBottomPadding: false,
            backgroundColor: Colors.brown[100],
            appBar: AppBar(
              backgroundColor: Colors.brown[400],
              elevation: 0.0,
              title: Text('Nouveau demande'),
              actions: [],
            ),
            body: Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    SizedBox(height: 20.0),
                    TextFormField(
                      decoration:
                          textInputDecoration.copyWith(hintText: 'budget max'),
                      onChanged: (val) {
                        setState(() => budget_max = double.parse(val));
                      },
                      /*validator: (val) => val.length < 6
                          ? 'Enter a password 6+ characters'
                          : null,*/
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      decoration:
                          textInputDecoration.copyWith(hintText: 'Commentiare'),
                      onChanged: (val) {
                        setState(() => commentaire = val);
                      },
                      /*validator: (val) => val.length < 6
                          ? 'Enter a password 6+ characters'
                          : null,*/
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      decoration: textInputDecoration.copyWith(
                          hintText: 'Numero de tel'),
                      onChanged: (val) {
                        setState(() => numero_tel = int.parse(val));
                      },
                      //validator: (val) => val.isEmpty ? 'Enter an email' : null,
                    ),
                    SizedBox(height: 20.0),
                    RaisedButton(
                      color: Colors.pink[400],
                      child: Text(
                        'Ajouter demande',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        // if (formKey.currentState.validate()) {
                        //   setState(() => loading = true);
                        //   dynamic result = await _authService
                        //       .signInWithEmailAndPassword(email, password);
                        //   if (result == null) {
                        //     setState(() {
                        //       error = 'Invalid credentials';
                        //       loading = false;
                        //     });
                        //   }
                        // }

                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(height: 12.0),
                    Text(error,
                        style: TextStyle(color: Colors.red, fontSize: 14.0))
                  ],
                ),
              ),
            ),
          );
  }
}
