import 'package:flutter/material.dart';
import 'auth/login_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// Onboarding screen for Alinda Experts
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  bool isLastPage = false;

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
        padding: const EdgeInsets.all(20),
        child: PageView(
          controller: _controller,
          onPageChanged: (index) =>
              setState(() => isLastPage = index == 2),
          children: [
            buildPage(
              image: 'images/tool1.jpn',
              title: 'Welcome to Alinda Experts',
              description:
                  'We bring your ideas to life through modern design and innovation.',
            ),
            buildPage(
              image: 'images/tool2.jpn',
              title: 'Creative Solutions',
              description:
                  'Get inspired with customized, high-quality creative services.',
            ),
            buildPage(
              image: 'images/tool3.jpn',
              title: 'Achieve More',
              description:
                  'Work with experts to turn your vision into success.',
            ),
          ],
        ),
      ),
      bottomSheet: isLastPage
          ? TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginScreen()),
                );
              },
              child: Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  color: const Color(0xFFE91E63),
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
            )
          : Container(
              height: 80,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    child: const Text(
                      'Skip',
                      style: TextStyle(
                        color: Color(0xFFE91E63),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onPressed: () => _controller.jumpToPage(2),
                  ),
                  Row(
                    children: [
                      SmoothPageIndicator(
                        controller: _controller,
                        count: 3,
                        effect: const WormEffect(
                          activeDotColor: Color(0xFFE91E63),
                          dotColor: Colors.grey,
                          dotHeight: 10,
                          dotWidth: 10,
                        ),
                      ),
                      const SizedBox(width: 15),
                      TextButton(
                        child: const Text(
                          'Next',
                          style: TextStyle(
                            color: Color(0xFFE91E63),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        onPressed: () => _controller.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }

  Widget buildPage({
    required String image,
    required String title,
    required String description,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(image, height: 300),
        const SizedBox(height: 40),
        Text(
          title,
          style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Color(0xFFE91E63),
          ),
        ),
        const SizedBox(height: 15),
        Text(
          description,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey[700],
            height: 1.4,
          ),
        ),
      ],
    );
  }
}
