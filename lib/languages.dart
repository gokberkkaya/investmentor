import 'package:flutter/material.dart';
import 'package:circle_flags/circle_flags.dart';

class Languages extends StatefulWidget {
  const Languages({Key? key}) : super(key: key);

  @override
  _LanguagesState createState() => _LanguagesState();
}

class _LanguagesState extends State<Languages> {
  int selectedKey = 1;
  showLang(iconname, lang, sk) {
    return GestureDetector(
        onTap: () {
          setState(() {
            selectedKey = sk;
          });
        },
        child: Container(
          color: const Color.fromARGB(0, 0, 0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleFlag('$iconname', size: 25),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, top: 2),
                    child: Text(
                      "$lang",
                      style: TextStyle(fontSize: 17),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  if (selectedKey == sk) ...[
                    Icon(
                      Icons.check_circle,
                      size: 30.0,
                      color: Colors.green,
                    )
                  ]
                ],
              ),
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                alignment: Alignment.topLeft,
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              'Bildirimler',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ]),
          const SizedBox(height: 40),
          Column(
            children: [
              showLang("tr", "Türkçe",0),
              const SizedBox(height: 10),
              Divider(),
              showLang("us", "English",1),
              const SizedBox(height: 10),
              Divider(),
              showLang("es", "Español",2),
              const SizedBox(height: 10),
              Divider(),
              showLang("it", "Italiano",3),
              const SizedBox(height: 10),
              Divider(),
              showLang("ru", "Русский",4),
              const SizedBox(height: 10),
              Divider(),
              showLang("cn", "中國人",5),
              const SizedBox(height: 10),
              Divider(),
              showLang("fr", "Français",6),
              const SizedBox(height: 10),
              Divider(),
              showLang("cz", "Čeština",7),
              const SizedBox(height: 10),
              Divider(),
              showLang("de", "Deutsch", 8),
              const SizedBox(height: 10),
              Divider(),
              showLang("id", "Bahasa Indonesia", 9),
              const SizedBox(height: 10),
              Divider(),
              showLang("jp", "日本語", 10),
              const SizedBox(height: 10),
              Divider(),
              showLang("kr", "한국어", 11),
              const SizedBox(height: 10),
              Divider(),
              showLang("pt", "Português", 12),
              const SizedBox(height: 10),
              Divider(),
              showLang("ua", "Українська", 13),
              const SizedBox(height: 10),
              Divider(),
              showLang("bg", "Български", 14),
              const SizedBox(height: 10),
              Divider(),
            ],
          )
        ]),
      ),
    );
  }
}
