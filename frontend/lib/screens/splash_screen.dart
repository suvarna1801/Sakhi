lib/screens/splash_screen.dart
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      checkUserLogin();
    });
  }

  void checkUserLogin() {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      // Already logged in -> Go to Home Dashboard
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      // Not logged in -> Go to Login
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/sakhi_logo.png', width: 180),
            const SizedBox(height: 20),
            const Text(
              'Sakhi',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFF8B2B6E),
              ),
            ),
            const Text(
              'Your Safety Companion',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 40),
            const CircularProgressIndicator(
              color: Color(0xFF8B2B6E),
            )
          ],
        ),
      ),
    );
  }
}
