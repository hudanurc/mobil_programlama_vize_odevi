import 'package:flutter/material.dart';

import 'anasayfa.dart';
import 'uyeol.dart';
import 'sifremiunuttum.dart';

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/anasayfa': (context) => Anasayfa(),
        '/uyeol': (context) => Uyeol(),
        '/sifremiunuttum': (context) => Sifremiunuttum(),
      },
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _loginPageState createState() => _loginPageState();
}

class _loginPageState extends State<LoginPage> {
  String userName;
  String password;

  final degerKey = GlobalKey<FormState>();

  @override
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
                    labelText: "Kullanıcı Adı",
                    labelStyle: TextStyle(color: Colors.purple),
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (value) {
                    userName = value;
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Şifre",
                    labelStyle: TextStyle(color: Colors.purple),
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (value) {
                    password = value;
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                      child: Text("Üye Ol"),
                      textColor: Colors.purple,
                      onPressed: () {
                        debugPrint("Butona Tıklandı");
                        Navigator.pushNamed(context, '/uyeol');
                      },
                    ),
                    MaterialButton(
                      child: Text("Şifremi Unuttum"),
                      textColor: Colors.purple,
                      onPressed: () {
                        debugPrint("Butona Tıklandı");
                        Navigator.pushNamed(context, '/sifremiunuttum');
                      },
                    ),
                  ],
                ),
                RaisedButton(
                  child: Text("Giriş"),
                  textColor: Colors.purple,
                  onPressed: () {
                    degerKey.currentState.save();
                    debugPrint("userName : $userName , password : $password");
                    if (userName == "demo" && password == "demo") {
                      debugPrint("Giriş başarılı bir şekilde gerçekleşmiştir.");

                      Navigator.of(context).pushReplacementNamed('/anasayfa');
                    } else {
                      debugPrint(
                          "Kullanıcı Adı ya da Şifre yanlış, lütfen tekrar deneyin.");
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
