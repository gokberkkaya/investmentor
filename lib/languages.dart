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