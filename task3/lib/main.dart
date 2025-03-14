import 'package:flutter/material.dart';
import 'package:task3/Splash_Screen.dart';

import 'Details_Page.dart'; // Import the new Profile Page
import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => const HomePage(),
        '/details': (context) =>  DetailsPage(), // NEW ROUTE

      },
    );
  }
}
