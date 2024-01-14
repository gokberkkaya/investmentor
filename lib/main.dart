import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:investmentor/app_localizations.dart';
import 'package:investmentor/services/notification_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'first_page.dart';
import 'splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'services/firebase_options.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print("Handling a background message: ${message.messageId}");
}

void main() async {
  

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final NotificationService notificationService = NotificationService();
  Locale ?_appLocale;

  


  @override
  void initState() {
    super.initState();
    _loadLanguagePreference();
    notificationService.initialize(); // Bildirim servisini başlat
    notificationService.scheduleDailyTenAMNotification(); // Her gün saat 10:00'da bildirim planla
  }

  Future<void> _loadLanguagePreference() async {
    final prefs = await SharedPreferences.getInstance();
    String languageCode = prefs.getString('selected_language') ?? 'tr';
    setState(() {
      _appLocale = Locale(languageCode, '');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       theme: ThemeData(
        primarySwatch: Colors.green,
        primaryColor: const Color.fromARGB(1000 ,0, 198, 121), 
       
      ),
      locale: _appLocale,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
       
        Locale('tr', ''), // Türkçe
        Locale('en', ''), // İngilizce
        Locale('es', ''), // İspanyolca
        Locale('it', ''), // İtalyanca
        Locale('ru', ''), // Rusça
        Locale('zh', ''), // Çince (Basitleştirilmiş)
        Locale('fr', ''), // Fransızca
        Locale('cs', ''), // Çekçe
        Locale('de', ''), // Almanca
        Locale('id', ''), // Endonezyaca
        Locale('ja', ''), // Japonca
        Locale('ko', ''), // Korece
        Locale('pt', ''), // Portekizce
        Locale('uk', ''), // Ukraynaca
        Locale('bg', ''), // Bulgarca
      ],
        home: SplashScreen(),
        routes: {
         '/firstpage': (context) => FirstPage(),
         
         
      },
    );
  }
}



