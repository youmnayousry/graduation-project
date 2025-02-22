import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to Login Screen after 15 seconds
    Timer(const Duration(seconds: 15), () {
      Navigator.pushReplacementNamed(context, '/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.asset(
            'assets/background.jpg', // Ensure this file exists in pubspec.yaml
            fit: BoxFit.cover,
          ),

          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0x8021628A), // Fully transparent at the top
                  Color(0x8021628A), // 50% opacity in the middle
                  Color(0xFF1F4C6B), // Fully opaque at the bottom
                ],
                stops: [0.0, 0.6, 1.0], // Smooth transition effect
              ),
            ),
          ),


          // Main Content
          SafeArea(
            child: Column(
              children: [
                const Spacer(flex:8 ), // Adjusts space above logo

                // Larger Logo Positioned in Center
                Center(
                  child: Image.asset(
                    'assets/app_icon.png', // Ensure this file exists in pubspec.yaml
                    height: 200, // ✅ Adjusted size
                  ),
                ),

                const Spacer(flex: 4), // Adjusts space between logo and button

                // "Let’s Start" Button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: SizedBox(
                    width: 210, // ✅ Slightly wider button
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/login');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF30AEE9), // ✅ Exact button color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 10), // ✅ Larger button height
                      ),
                      child: const Text(
                        "let’s start",
                        style: TextStyle(fontSize: 20, color: Colors.white), // ✅ Increased font size
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 10), // ✅ Increased spacing before footer

                // Footer Text with "v1.0" in bold
                const Text.rich(
                  TextSpan(
                    text: "Made with Love\n", // Normal text
                    style: TextStyle(fontSize: 16, color: Colors.white70),
                    children: [
                      TextSpan(
                        text: "v1.0", // Bold version
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 20), // Adjust bottom spacing
              ],
            ),
          ),
        ],
      ),
    );
  }
}
