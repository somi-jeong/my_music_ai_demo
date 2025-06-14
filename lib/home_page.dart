import 'package:flutter/material.dart';
import 'package:my_music_ai_demo/credit_page.dart';
import 'package:my_music_ai_demo/saved_page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'custom_image_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Future<void> _launchURL() async {
    final Uri url = Uri.parse("https://2025aihackathon.vercel.app/upload");
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
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
              Image.asset('assets/logo_bird.png', width: 400, height: 400),
              CustomImageButton(onTap: _launchURL, label: "New"),
              const SizedBox(height: 20),
              CustomImageButton(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SavedPage()),
                  );
                },
                label: "Saved",
              ),
              const SizedBox(height: 20),
              CustomImageButton(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CreditPage()),
                  );
                },
                label: "Credit",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
