import 'package:flutter/material.dart';
import 'package:investmentor/app_localizations.dart';
import 'package:investmentor/loaded_coins.dart';
import 'package:investmentor/notifications.dart';
import 'package:investmentor/showModalBottom.dart';
import 'package:investmentor/src/detectArbitrage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController minimumValue = TextEditingController();
  TextEditingController maximumValue = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ignore: sort_child_properties_last
            Row(children: [IconButton(onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Notifications(),
                  ),
                );
            }, 
            icon: const Icon(Icons.notifications_none))], mainAxisAlignment: MainAxisAlignment.end,),
            Text(
              AppLocalizations.of(context)!.translate('home_page_welcome_message'),
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 60),
            Text(
              AppLocalizations.of(context)!.translate('home_page_define_interval'),
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey[600]),
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: minimumValue,
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)!.translate('home_page_minimum_percentage'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                const Text(
                  '-',
                  style: TextStyle(fontSize: 24),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextFormField(
                    controller: maximumValue,
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)!.translate('home_page_maximum_percentage'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: ()async {
                 var result = await detectArbitrage(double.parse(minimumValue.text), double.parse(maximumValue.text));

                showModalBottom(context, LoadedCoins(data: result));
              },
              style: ElevatedButton.styleFrom(
                fixedSize: Size(MediaQuery.of(context).size.width * 1, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                backgroundColor: const Color.fromARGB(1000 ,0, 198, 121),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  AppLocalizations.of(context)!.translate('home_page_load_coins_button'),
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      );
  }
}