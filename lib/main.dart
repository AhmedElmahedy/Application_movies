import 'dart:io';

import 'package:app_movies/home_screen.dart';
import 'package:app_movies/my_theme_data.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid?
  await Firebase.initializeApp(
    options:  FirebaseOptions(apiKey: 'AIzaSyAQS4FB44CvxPhE3Ss8Vpv1PIDM0Iasze0',
        appId: 'com.example.app_movies',
        messagingSenderId: '595774627975',
        projectId: '')

  ):
      await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyThemeData.darkTheme,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName : (context) => HomeScreen(),
      },
    );
  }
}
