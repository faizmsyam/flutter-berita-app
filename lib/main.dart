import 'package:flutter/material.dart';
import 'splashscreen/splashscreen.dart';
import 'config/config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: nameApp,
      theme: ThemeData(
        fontFamily: 'NotoSansJP',
        primarySwatch: Colors.orange,
      ),
      home: SplashScreen(),
    );
  }
}
