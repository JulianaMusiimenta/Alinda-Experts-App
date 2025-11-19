import 'dart:async';
import 'package:flutter/material.dart';
import 'onboarding_screen.dart';

class splashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<splashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    // Fade-in animation
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _fadeAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _controller.forward();

    // Move to Onboarding after 3 seconds
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnboardingScreen()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Color(0xFFFFE4F1)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 🔥 NEW ICON (replaces broken image)
                Container(
                  height: 110,
                  width: 110,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple.shade50,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color.fromARGB(255, 61, 30, 233),
                      width: 3,
                    ),
                  ),
                  child: const Icon(
                    Icons.engineering,
                    size: 60,
                    color: Color.fromARGB(255, 61, 30, 233),
                  ),
                ),

                const SizedBox(height: 20),

                const Text(
                  "Alinda Experts",
                  style: TextStyle(
                    color: Color.fromARGB(255, 43, 49, 227),
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.3,
                  ),
                ),

                const SizedBox(height: 40),

                const CircularProgressIndicator(
                  color: Color.fromARGB(255, 61, 30, 233),
                  strokeWidth: 3,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
