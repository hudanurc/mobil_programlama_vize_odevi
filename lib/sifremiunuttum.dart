import 'dart:io';

import 'package:flutter/material.dart';

void main() {
  runApp(Sifremiunuttum());
}

class Sifremiunuttum extends StatelessWidget {
  @override
  String email;
  final degerKey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Form(
          key: degerKey,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Email Adresinizi Giriniz",
                    labelStyle: TextStyle(color: Colors.purple),
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (value) {
                    email = value;
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RaisedButton(
                      child: Text("Şifre Sıfırlama Kodu Gönder"),
                      textColor: Colors.purple,
                      onPressed: () {
                        degerKey.currentState.save();
                        Navigator.pushNamed(context, '/');

                        debugPrint(
                            "$email adresine sıfırlama kodu gönderilmiştir.");
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
