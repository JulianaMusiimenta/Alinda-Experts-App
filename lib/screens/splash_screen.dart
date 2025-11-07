// Importing necessary Dart and Flutter libraries
import 'dart:async'; // For the Timer
import 'package:flutter/material.dart';
import 'onboarding_screen.dart'; // Importing the next screen

// SplashScreen widget (stateful because it changes over time)
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState(); // Corrected state name
}

// The state class that handles animations and navigation logic
class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller; // Controls the animation
  late Animation<double> _fadeAnimation; // Defines the fade-in effect

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller with 2 seconds duration
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    // Define a curved fade animation (smooth in and out)
    _fadeAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

    // Start the fade-in animation immediately
    _controller.forward();

    // Wait for 3 seconds, then navigate to the Onboarding screen
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnboardingScreen()),
      );
    });
  }

  @override
  void dispose() {
    // Dispose the controller when the screen is destroyed to prevent memory leaks
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Main UI of the splash screen
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          // A soft white-to-pink gradient background
          gradient: LinearGradient(
            colors: [Colors.white, Color(0xFFFFE4F1)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          // Fade transition for the logo and text
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // App logo (ensure image is listed in pubspec.yaml)
                Image.asset('images/logo1.jpeg', height: 100),

                const SizedBox(height: 20),

                // App name text
                const Text(
                  "Tebac Designers",
                  style: TextStyle(
                    color: Color(0xFFE91E63), // Signature pink color
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.3,
                  ),
                ),

                const SizedBox(height: 40),

                // Loading spinner (progress indicator)
                const CircularProgressIndicator(
                  color: Color(0xFFE91E63), // Matches the text color
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
