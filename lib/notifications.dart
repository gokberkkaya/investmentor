import 'package:flutter/material.dart';
import 'package:investmentor/app_localizations.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  
  getNotification(notification, time) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$notification",
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          )
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(height: 20),
          Text(
            "$time",
            style: const TextStyle(
                fontSize: 12, color: Color.fromARGB(112, 112, 112, 1)),
            textAlign: TextAlign.end,
          )
        ],
      ),
      const SizedBox(height: 10),
      const Divider(),
      const SizedBox(height: 20),
    
    ],)
     ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 40, right: 40, top: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                AppLocalizations.of(context)!.translate('notifications'),
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ]),


          const SizedBox(height: 30,),

          Expanded(child: SingleChildScrollView(child: Column(children: [
            getNotification("İletişim bilgilerini hala güncellemedin,güncellemeye ne dersin?", "3sa önce"),
            getNotification("3 gündür seni göremedik, yatırımlarını kontrol etmek ister misin?", "15dk önce"),
            getNotification("İletişim bilgilerini hala güncellemedin,güncellemeye ne dersin?", "3sa önce"),
            getNotification("3 gündür seni göremedik, yatırımlarını kontrol etmek ister misin?", "15dk önce"),
            getNotification("İletişim bilgilerini hala güncellemedin,güncellemeye ne dersin?", "3sa önce"),
            getNotification("3 gündür seni göremedik, yatırımlarını kontrol etmek ister misin?", "15dk önce"),
            getNotification("3 gündür seni göremedik, yatırımlarını kontrol etmek ister misin?", "15dk önce"),
            getNotification("İletişim bilgilerini hala güncellemedin,güncellemeye ne dersin?", "3sa önce"),
            getNotification("3 gündür seni göremedik, yatırımlarını kontrol etmek ister misin?", "15dk önce"),
          ]),))
          

         


          ],
        ),
      ),
    );
  }
}
