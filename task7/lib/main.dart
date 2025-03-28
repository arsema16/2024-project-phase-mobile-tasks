import 'package:flutter/material.dart';
//import 'Screen_1.dart';
import 'Screen_2.dart';
// ignore: unused_import
import 'Screen_3.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'facebook',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
 initialRoute: '/',
      routes: {
        '/': (context) =>  Screen2(),
        '/Home': (context) => Screen2(),

      },    );
  }
}

