import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'buyers/views/auth/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid ? await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyALsy_hbMThSFI1N-GUJgKphg9CItohHBY", 
      appId: "1:460173077296:android:cf96d617521eac2c8976f5", 
      messagingSenderId: "460173077296", 
      projectId: "store-mobile-ab8b2",
      storageBucket: "gs://store-mobile-ab8b2.appspot.com",
    )
  ) : await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white70),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}

