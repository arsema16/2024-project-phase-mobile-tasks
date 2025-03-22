import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 58, 67, 247), // Dark Blue
            Color(0xFF4A54E1), // Medium Blue
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor:
            Colors.transparent, // Make Scaffold background transparent
        body: Center( // Center everything
  child: Column(
    mainAxisSize: MainAxisSize.min, // Make it take only needed space
    children: [
      Container(
        width: 212,
        height: 197,
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(shape: BoxShape.circle),
        child: Image.asset('assets/images/image.png'),
      ),
      const SizedBox(height: 20), // Add spacing
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 50), // Left & Right margin
        width: 316,
        height: 243,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(27), // Rounded corners
        ),
        padding: const EdgeInsets.all(20), // Add padding inside
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align text to left
          children: [
            const Text(
              'Profile',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold, // Make bold
              ),
            ),
            const SizedBox(height: 10),
            const Text('Name: GDG Mentee'),
            const SizedBox(height: 10),
            const Text('Group Number: GDG Group No'),
            const SizedBox(height: 10),
            const Text('Fav Food: Shero'),
          ],
        ),
      ),
    ],
  ),
),

      ),
    );
  }
}
