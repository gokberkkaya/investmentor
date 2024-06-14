import 'package:flutter/material.dart';
import 'package:investmentor/app_localizations.dart';
import 'package:investmentor/src/timeAgo_function.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  Future<List<String>> _loadNotifications() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> allNotifications = prefs.getStringList('notifications') ?? [];
    DateTime now = DateTime.now();

    // Gelecekteki bildirimleri filtrele
    List<String> validNotifications = allNotifications.where((notification) {
      var parts = notification.split(' | ');
      DateTime notificationDate = DateTime.parse(parts[1]);
      return notificationDate.isBefore(now) || notificationDate.isAtSameMomentAs(now);
    }).toList();

    return validNotifications.toList(); 
    
  }

  getNotification(notification, time) {
    String timeago = timeAgoSinceDate(time);
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
              "$timeago",
              style: const TextStyle(
                  fontSize: 12, color: Color.fromARGB(112, 112, 112, 1)),
              textAlign: TextAlign.end,
            )
          ],
        ),
        const SizedBox(height: 10),
        const Divider(),
        const SizedBox(height: 20),
      ],
    );
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
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ]),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: FutureBuilder<List<String>>(
                future: _loadNotifications(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('Bildirim yok'));
                  }

                  List<String> reversedData =
                      List.from(snapshot.data!.reversed);

                  List<Widget> notificationWidgets = reversedData
                      .map((notification) {
                        var parts = notification.split(' | ');
                        return getNotification(parts[0], parts[1]);
                      })
                      .toList()
                      .cast<Widget>(); // Bu satır eklendi

                  return ListView(children: notificationWidgets);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
