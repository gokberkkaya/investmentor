<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:circle_flags/circle_flags.dart';


class Languages extends StatefulWidget {
  const Languages({ Key? key }) : super(key: key);

  @override
  _LanguagesState createState() => _LanguagesState();
}

class _LanguagesState extends State<Languages> {
  int selectedKey =1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Padding(
        padding: const EdgeInsets.all(40),
        child: Column(  
          children:[
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
            ],),
            
          const SizedBox(height: 10),
         


          Row(
             mainAxisAlignment: MainAxisAlignment.center, 
            children:[
              Text(
               'Bildirimler',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
            ),]
             
          ),
            const SizedBox(height: 40),
           Column(
  children: [
      GestureDetector(
      onTap: () {
        setState(() {
          selectedKey = 0;
        });
      },
      child:Container(
        color: const Color.fromARGB(0,0,0,0),
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleFlag('tr', size: 25),
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 2),
                child: Text(
                  "Türkçe",
                  style: TextStyle(fontSize: 17),
                ),
              )
            ],
          ),
          Row(
            children: [
              if (selectedKey == 0) ...[
                Icon(
                  Icons.check_circle,
                  size: 30.0,
                  color: Colors.green,
                )
              ]
            ],
          ),
        ],
      ),)
    ),
    const SizedBox(height: 10),
    Divider(),
      GestureDetector(
      onTap: () {
        setState(() {
          selectedKey = 1;
        });
      },
      child:Container(
        color: const Color.fromARGB(0,0,0,0),
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleFlag('us', size: 25),
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 2),
                child: Text(
                  "English",
                  style: TextStyle(fontSize: 17),
                ),
              )
            ],
          ),
          Row(
            children: [
              if (selectedKey == 1) ...[
                Icon(
                  Icons.check_circle,
                  size: 30.0,
                  color: Colors.green,
                )
              ]
            ],
          ),
        ],
      ),)
    ),
    const SizedBox(height: 10),
    Divider(),
      GestureDetector(
      onTap: () {
        setState(() {
          selectedKey = 2;
        });
      },
      child:Container(
        color: const Color.fromARGB(0,0,0,0),
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleFlag('es', size: 25),
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 2),
                child: Text(
                  "Español",
                  style: TextStyle(fontSize: 17),
                ),
              )
            ],
          ),
          Row(
            children: [
              if (selectedKey == 2) ...[
                Icon(
                  Icons.check_circle,
                  size: 30.0,
                  color: Colors.green,
                )
              ]
            ],
          ),
        ],
      ),)
    ),
    const SizedBox(height: 10),
    Divider(),
      GestureDetector(
      onTap: () {
        setState(() {
          selectedKey = 3;
        });
      },
      child:Container(
        color: const Color.fromARGB(0,0,0,0),
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleFlag('it', size: 25),
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 2),
                child: Text(
                  "Italiano",
                  style: TextStyle(fontSize: 17),
                ),
              )
            ],
          ),
          Row(
            children: [
              if (selectedKey == 3) ...[
                Icon(
                  Icons.check_circle,
                  size: 30.0,
                  color: Colors.green,
                )
              ]
            ],
          ),
        ],
      ),)
    ),
    const SizedBox(height: 10),
    Divider(),
      GestureDetector(
      onTap: () {
        setState(() {
          selectedKey = 4;
        });
      },
      child:Container(
        color: const Color.fromARGB(0,0,0,0),
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleFlag('ru', size: 25),
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 2),
                child: Text(
                  "Русский",
                  style: TextStyle(fontSize: 17),
                ),
              )
            ],
          ),
          Row(
            children: [
              if (selectedKey == 4) ...[
                Icon(
                  Icons.check_circle,
                  size: 30.0,
                  color: Colors.green,
                )
              ]
            ],
          ),
        ],
      ),)
    ),
    const SizedBox(height: 10),
    Divider(),
      GestureDetector(
      onTap: () {
        setState(() {
          selectedKey = 5;
        });
      },
      child:Container(
        color: const Color.fromARGB(0,0,0,0),
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleFlag('cn', size: 25),
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 2),
                child: Text(
                  "中國人",
                  style: TextStyle(fontSize: 17),
                ),
              )
            ],
          ),
          Row(
            children: [
              if (selectedKey == 5) ...[
                Icon(
                  Icons.check_circle,
                  size: 30.0,
                  color: Colors.green,
                )
              ]
            ],
          ),
        ],
      ),)
    ),
    const SizedBox(height: 10),
    Divider(),
      GestureDetector(
      onTap: () {
        setState(() {
          selectedKey = 6;
        });
      },
      child:Container(
        color: const Color.fromARGB(0,0,0,0),
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleFlag('fr', size: 25),
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 2),
                child: Text(
                  "Français",
                  style: TextStyle(fontSize: 17),
                ),
              )
            ],
          ),
          Row(
            children: [
              if (selectedKey == 6) ...[
                Icon(
                  Icons.check_circle,
                  size: 30.0,
                  color: Colors.green,
                )
              ]
            ],
          ),
        ],
      ),)
    ),
    const SizedBox(height: 10),
    Divider(),
      GestureDetector(
      onTap: () {
        setState(() {
          selectedKey = 7;
        });
      },
      child:Container(
        color: const Color.fromARGB(0,0,0,0),
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleFlag('cz', size: 25),
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 2),
                child: Text(
                  "Čeština",
                  style: TextStyle(fontSize: 17),
                ),
              )
            ],
          ),
          Row(
            children: [
              if (selectedKey == 7) ...[
                Icon(
                  Icons.check_circle,
                  size: 30.0,
                  color: Colors.green,
                )
              ]
            ],
          ),
        ],
      ),)
    ),
    const SizedBox(height: 10),
    Divider(),
      GestureDetector(
      onTap: () {
        setState(() {
          selectedKey = 8;
        });
      },
      child:Container(
        color: const Color.fromARGB(0,0,0,0),
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleFlag('de', size: 25),
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 2),
                child: Text(
                  "Deutsch",
                  style: TextStyle(fontSize: 17),
                ),
              )
            ],
          ),
          Row(
            children: [
              if (selectedKey == 8) ...[
                Icon(
                  Icons.check_circle,
                  size: 30.0,
                  color: Colors.green,
                )
              ]
            ],
          ),
        ],
      ),)
    ),
    const SizedBox(height: 10),
    Divider(),
      GestureDetector(
      onTap: () {
        setState(() {
          selectedKey = 9;
        });
      },
      child:Container(
        color: const Color.fromARGB(0,0,0,0),
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleFlag('id', size: 25),
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 2),
                child: Text(
                  "Bahasa Indonesia",
                  style: TextStyle(fontSize: 17),
                ),
              )
            ],
          ),
          Row(
            children: [
              if (selectedKey == 9) ...[
                Icon(
                  Icons.check_circle,
                  size: 30.0,
                  color: Colors.green,
                )
              ]
            ],
          ),
        ],
      ),)
    ),
    const SizedBox(height: 10),
    Divider(),
      GestureDetector(
      onTap: () {
        setState(() {
          selectedKey = 10;
        });
      },
      child:Container(
        color: const Color.fromARGB(0,0,0,0),
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleFlag('jp', size: 25),
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 2),
                child: Text(
                  "日本語",
                  style: TextStyle(fontSize: 17),
                ),
              )
            ],
          ),
          Row(
            children: [
              if (selectedKey == 10) ...[
                Icon(
                  Icons.check_circle,
                  size: 30.0,
                  color: Colors.green,
                )
              ]
            ],
          ),
        ],
      ),)
    ),
    const SizedBox(height: 10),
    Divider(),
      GestureDetector(
      onTap: () {
        setState(() {
          selectedKey = 11;
        });
      },
      child:Container(
        color: const Color.fromARGB(0,0,0,0),
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleFlag('kr', size: 25),
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 2),
                child: Text(
                  "한국어",
                  style: TextStyle(fontSize: 17),
                ),
              )
            ],
          ),
          Row(
            children: [
              if (selectedKey == 11) ...[
                Icon(
                  Icons.check_circle,
                  size: 30.0,
                  color: Colors.green,
                )
              ]
            ],
          ),
        ],
      ),)
    ),
    const SizedBox(height: 10),
    Divider(),
      GestureDetector(
      onTap: () {
        setState(() {
          selectedKey = 12;
        });
      },
      child:Container(
        color: const Color.fromARGB(0,0,0,0),
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleFlag('pt', size: 25),
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 2),
                child: Text(
                  "Português",
                  style: TextStyle(fontSize: 17),
                ),
              )
            ],
          ),
          Row(
            children: [
              if (selectedKey == 12) ...[
                Icon(
                  Icons.check_circle,
                  size: 30.0,
                  color: Colors.green,
                )
              ]
            ],
          ),
        ],
      ),)
    ),
    const SizedBox(height: 10),
    Divider(),
      GestureDetector(
      onTap: () {
        setState(() {
          selectedKey =13;
        });
      },
      child:Container(
        color: const Color.fromARGB(0,0,0,0),
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleFlag('ua', size: 25),
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 2),
                child: Text(
                  "Українська ",
                  style: TextStyle(fontSize: 17),
                ),
              )
            ],
          ),
          Row(
            children: [
              if (selectedKey == 13) ...[
                Icon(
                  Icons.check_circle,
                  size: 30.0,
                  color: Colors.green,
                )
              ]
            ],
          ),
        ],
      ),)
    ),
    const SizedBox(height: 10),
    Divider(),
     GestureDetector(
      onTap: () {
        setState(() {
          selectedKey = 14;
        });
      },
      child:Container(
        color: const Color.fromARGB(0,0,0,0),
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleFlag('bg', size: 25),
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 2),
                child: Text(
                  "Български",
                  style: TextStyle(fontSize: 17),
                ),
              )
            ],
          ),
          Row(
            children: [
              if (selectedKey == 14) ...[
                Icon(
                  Icons.check_circle, 
                  size: 30.0,
                  color: Colors.green,
                )
              ]
            ],
          ),
        ],
      ),)
    ),
    const SizedBox(height: 10),
    Divider(),
  ],
)
            
             
          ]
        ),
      ) ,

    );
  }
}
=======
import 'package:flutter/material.dart';
import 'package:circle_flags/circle_flags.dart';
import 'package:investmentor/app_localizations.dart';
import 'package:restart_app/restart_app.dart';
import 'package:shared_preferences/shared_preferences.dart';



class Languages extends StatefulWidget {
  const Languages({Key? key}) : super(key: key);

  @override
  _LanguagesState createState() => _LanguagesState();
}

class _LanguagesState extends State<Languages> {
  int ?selectedKey;

final Map<String, int> languageCodes = {
    'tr': 0,
    'en': 1,
    'es': 2,
    'it': 3,
    'ru': 4,
    'cn': 5,
    'fr': 6,
    'cz': 7,
    'de': 8,
    'id': 9,
    'jp': 10,
    'kr': 11,
    'pt': 12,
    'uk': 13,
    'bg': 14,
  };

  @override
  void initState() {
    super.initState();
    _loadLanguagePreference();
  }

  Future<void> _loadLanguagePreference() async {
    final prefs = await SharedPreferences.getInstance();
    String languageCode = prefs.getString('selected_language') ?? 'tr';
    setState(() {
      selectedKey = languageCodes[languageCode];
    });
  }

  Future<void> _saveLanguagePreference(String languageCode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('selected_language', languageCode);
  }

  void _changeLanguage(String languageCode, int sk) async {
    await _saveLanguagePreference(languageCode);
    setState(() {
      selectedKey = sk;
    });
    Restart.restartApp(webOrigin: '');
  }


  showLang(iconname, langcode, lang, sk) {
    return GestureDetector(
    onTap: () => _changeLanguage(langcode, sk),
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
                      style: const TextStyle(fontSize: 17),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  if (selectedKey == sk) ...[
                    const Icon(
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
        padding: const EdgeInsets.only(left: 40, right: 40, top: 40),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                alignment: Alignment.topLeft,
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              AppLocalizations.of(context)!.translate('languages_title'),
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ]),
          const SizedBox(height: 40),

        
        Expanded(child: SingleChildScrollView(child: Column(children: [
          showLang("tr", "tr", "Türkçe",0),
          const SizedBox(height: 10),
          const Divider(),
          showLang("us", "en", "English",1),
          const SizedBox(height: 10),
          const Divider(),
          showLang("es", "es", "Español",2),
          const SizedBox(height: 10),
          const Divider(),
          showLang("it", "it", "Italiano",3),
          const SizedBox(height: 10),
          const Divider(),
          showLang("ru", "ru", "Русский",4),
          const SizedBox(height: 10),
          const Divider(),
          showLang("cn", "zh", "中國人",5),
          const SizedBox(height: 10),
          const Divider(),
          showLang("fr", "fr", "Français",6),
          const SizedBox(height: 10),
          const Divider(),
          showLang("cz", "cs", "Čeština",7),
          const SizedBox(height: 10),
          const Divider(),
          showLang("de", "de", "Deutsch", 8),
          const SizedBox(height: 10),
          const Divider(),
          showLang("id", "id", "Bahasa Indonesia", 9),
          const SizedBox(height: 10),
          const Divider(),
          showLang("jp", "ja", "日本語", 10),
          const SizedBox(height: 10),
          const Divider(),
          showLang("kr", "ko", "한국어", 11),
          const SizedBox(height: 10),
          const Divider(),
          showLang("pt", "pt", "Português", 12),
          const SizedBox(height: 10),
          const Divider(),
          showLang("ua", "uk", "Українська", 13),
          const SizedBox(height: 10),
          const Divider(),
          showLang("bg", "bg", "Български", 14),
          const SizedBox(height: 10),
          const Divider(),
        ]),))



        ]),
      ),
    );
  }
}
>>>>>>> 1c352a13602d1aab9b2372d9767a64365936c917
