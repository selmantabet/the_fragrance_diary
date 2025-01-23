import 'package:flutter/material.dart';
import 'package:the_fragrance_diary/pages/home.dart';
import 'package:the_fragrance_diary/pages/splash.dart';
import 'package:the_fragrance_diary/pages/wardrobe.dart';
import 'package:the_fragrance_diary/pages/fragrance_info.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:the_fragrance_diary/services/database_service.dart';
import 'firebase_options.dart';

Future<void> bindFirebase() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseService().database; // Initialize the databas
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  print('Firebase initialized');
}

void main() {
  bindFirebase();
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => SplashScreen(),
      '/home': (context) => HomePageWidget(),
      '/wardrobe': (context) => WardrobeWidget(),
      '/fragrance_info': (context) => FragranceInfoWidget(),
    },
  ));
}
