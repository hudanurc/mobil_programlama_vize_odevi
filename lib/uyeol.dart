import 'package:flutter/material.dart';

String sifre;
String sifretekrar;
final degerKey = GlobalKey<FormState>();

class Uyeol extends StatelessWidget {
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
                    labelText: ("Email"),
                    labelStyle: TextStyle(color: Colors.purple),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: ("Kullanıcı Adı"),
                    labelStyle: TextStyle(color: Colors.purple),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: ("Şifre"),
                    labelStyle: TextStyle(color: Colors.purple),
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (value) {
                    sifre = value;
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: ("Şifre Tekrar"),
                    labelStyle: TextStyle(color: Colors.purple),
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (value) {
                    sifretekrar = value;
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                      child: Text("Vazgeç"),
                      textColor: Colors.purple,
                      onPressed: () {
                        debugPrint("Butona Tıklandı");
                        Navigator.pop(context, '/');
                      },
                    ),
                  ],
                ),
                RaisedButton(
                  child: Text("Kaydol"),
                  textColor: Colors.purple,
                  onPressed: () {
                    degerKey.currentState.save();
                    debugPrint("sifre : $sifre , sifretekrar : $sifretekrar");
                    if (sifre == sifretekrar) {
                      debugPrint("Kayıt başarılı bir şekilde gerçekleşmiştir.");

                      Navigator.pushNamed(context, '/');
                    } else {
                      debugPrint(
                          "Şifreleriniz uyuşmuyor, lütfen tekrar deneyin.");
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
