import 'package:flutter/material.dart';
import 'auth/login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Alinda Experts"),
        backgroundColor: const Color(0xFF431EE9),
        centerTitle: true,
      ),

      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Color(0xFFFFE4F1)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.all(20),
        child: PageView(
          controller: _controller,
          onPageChanged: (index) {
            setState(() => isLastPage = index == 2);
          },
          children: [
            OnboardPage(
              imagePath: 'assets/images/tools1.jpg',
              title: 'Professional Tools',
              description:
                  'We use high quality tools for all services.',
            ),
            OnboardPage(
              imagePath: 'assets/images/tools2.jpg',
              title: 'Organized Workspace',
              description:
                  'Everything arranged for efficiency and speed.',
            ),
            OnboardPage(
              imagePath: 'assets/images/tools3.jpg',
              title: 'Reliable Service',
              description:
                  'Fast, professional and dependable solutions.',
            ),
          ],
        ),
      ),

      bottomSheet: isLastPage
          ? SizedBox(
              height: 80,
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const LoginScreen()),
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    color: const Color(0xFF431EE9),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'Get Started',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )
          : Container(
              height: 80,
              padding:
                  const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () =>
                        _controller.jumpToPage(2),
                    child: const Text(
                      'Skip',
                      style: TextStyle(
                        color: Color(0xFF431EE9),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () =>
                        _controller.nextPage(
                      duration:
                          const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    ),
                    child: const Text(
                      'Next',
                      style: TextStyle(
                        color: Color(0xFF431EE9),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

class OnboardPage extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;

  const OnboardPage({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          imagePath,
          height: 220,
          fit: BoxFit.contain,
        ),
        const SizedBox(height: 40),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Color(0xFF431EE9),
          ),
        ),
        const SizedBox(height: 15),
        Text(
          description,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.grey,
            height: 1.4,
          ),
        ),
      ],
    );
  }
}