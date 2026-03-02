import 'package:flutter/material.dart';
import '../constants/app_images.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Alinda Experts"),
        backgroundColor: const Color(0xFF431EE9),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 30),

            // 🔥 LOGO WITH WHITE BACKGROUND + SHADOW
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 12,
                    spreadRadius: 3,
                  ),
                ],
              ),
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(AppImages.logo),
                backgroundColor: Colors.transparent,
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              "Alinda Mechanical Experts!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF431EE9),
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              "From expert repairs to personalized service, we provide mechanical solutions designed specifically for your vehicle’s needs.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 35),

            buildButton(Icons.style, "View Collection"),
            const SizedBox(height: 15),
            buildButton(Icons.recommend, "Recommended for You"),
            const SizedBox(height: 15),
            buildButton(Icons.contact_phone, "Contact Us"),

            const SizedBox(height: 40),

            const Text(
              "Designed with ❤️ by Alinda Experts",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildButton(IconData icon, String label) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: Icon(icon, color: Colors.white),
        label: Text(
          label,
          style: const TextStyle(color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF431EE9),
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),
    );
  }
}