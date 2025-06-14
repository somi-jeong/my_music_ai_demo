import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CreditPage extends StatelessWidget {
  const CreditPage({super.key});

  @override
  Widget build(BuildContext context) {
    final nameStyle = GoogleFonts.atma(fontSize: 24, color: Colors.black);
    final titleStyle = GoogleFonts.atma(
      fontSize: 36,
      fontWeight: FontWeight.bold,
      color: Colors.black87,
    );

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFCAD4D1), Color(0xFFDAB7B1)],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 60),
              Text("Credit", style: titleStyle),
              const SizedBox(height: 20),
              Image.asset('assets/happy_bird.png', width: 300, height: 300),
              const SizedBox(height: 20),
              Text("Jiyoun", style: nameStyle),
              Text("Melana", style: nameStyle),
              Text("Mia", style: nameStyle),
              Text("Somi", style: nameStyle),
              Text("Tian", style: nameStyle),
            ],
          ),
        ),
      ),
    );
  }
}
