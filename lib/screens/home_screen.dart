import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'TEBAC Designers',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xFFE91E63), // pink 
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Business logo or image
              Container(
                margin: const EdgeInsets.only(top: 20, bottom: 20),
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Color(0xFFE91E63), width: 3),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/logo1.jpeg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // Welcome text
              const Text(
                'Welcome to TEBAC Designers!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFE91E63),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),

              const Text(
                'Discover elegant fashion designs, custom suits, and personalized recommendations tailored just for you.',
                style: TextStyle(fontSize: 16, color: Colors.black87, height: 1.4),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),

              // Buttons for navigation
              buildButton(
                context,
                icon: Icons.style,
                label: 'View Collection',
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (_) => ProductsScreen()));
                },
              ),
              const SizedBox(height: 15),

              buildButton(
                context,
                icon: Icons.recommend,
                label: 'Recommended for You',
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (_) => RecommendationScreen()));
                },
              ),
              const SizedBox(height: 15),

              buildButton(
                context,
                icon: Icons.contact_phone,
                label: 'Contact Us',
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (_) => ContactScreen()));
                },
              ),
              const SizedBox(height: 40),

              // Footer text
              const Text(
                'Designed with ❤️ by TEBAC Designers',
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Reusable button builder
  Widget buildButton(BuildContext context,
      {required IconData icon, required String label, required VoidCallback onTap}) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: onTap,
        icon: Icon(icon, color: Colors.white),
        label: Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFE91E63),
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 2,
        ),
      ),
    );
  }
}

