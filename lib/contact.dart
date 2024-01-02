import 'package:flutter/material.dart';
import 'package:investmentor/app_localizations.dart';


class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  double marginOfHigh= 20.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: <Widget>[
            Row(mainAxisAlignment: MainAxisAlignment.start, 
            children: [
              IconButton(
              alignment: Alignment.topLeft,
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
                },
            ),
            
            ],),
            
          const SizedBox(height: 10),
            Text(
              AppLocalizations.of(context)!.translate('contact_title'),
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),SizedBox(height: marginOfHigh,),
            TextFormField(
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.translate('contact_username'),
                  labelStyle: const TextStyle(
                    color: Color.fromARGB(51, 51, 51, 1)
                  ),
                ),
              ),SizedBox(height: marginOfHigh,),
               TextFormField(
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.translate('contact_birthday'),
                  labelStyle: const TextStyle(
                    color:  Color.fromARGB(51, 51, 51, 1)
                  ),
                ),
              ),SizedBox(height: marginOfHigh,),
               TextFormField(
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.translate('contact_gender'),
                  labelStyle: const TextStyle(
                    color: Color.fromARGB(51, 51, 51, 1)
                  ),
                ),
              ),SizedBox(height: marginOfHigh,),
               TextFormField(
                decoration:InputDecoration(
                  labelText: AppLocalizations.of(context)!.translate('contact_email'),
                  labelStyle: const TextStyle(
                    color: Color.fromARGB(51, 51, 51, 1)
                  ),
                ),
              ),SizedBox(height: marginOfHigh,),
               TextFormField(
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.translate('contact_phone_number'),
                  labelStyle: const TextStyle(
                    color: Color.fromARGB(51, 51, 51, 1)
                  ),
                ),
              ),  SizedBox(height: marginOfHigh,),
              TextFormField(
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.translate('contact_address'),
                  labelStyle: const TextStyle(
                    color: Color.fromARGB(51, 51, 51, 1)
                  ),
                ),
              ), SizedBox(height: marginOfHigh*2,),
              ElevatedButton(
              onPressed: () {
                
              },
              style: ElevatedButton.styleFrom(
                fixedSize: Size(MediaQuery.of(context).size.width * 0.8, 50), backgroundColor: const Color.fromARGB(1000 ,0, 198, 121),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0), // Oval hale getir
                ), // Yeşil renk
              ),
              
              child:  Padding(
                
                padding:  const EdgeInsets.all(10.0),
                child: Text(
                  AppLocalizations.of(context)!.translate('contact_update_button'),
                  style: const TextStyle(fontSize: 18),
                ),
              ),
              )
    
             
              
          ],
      
          ),
      )
      ),
    );
  }
}