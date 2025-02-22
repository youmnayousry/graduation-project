import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/password_screen.dart';
import 'screens/confirmation_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Auth UI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/', // ✅ Starts with the Splash Screen
      routes: {
        '/': (context) =>  SplashScreen(),
        '/login': (context) =>  LoginScreen(),
        '/forgot_password': (context) => ForgotPasswordScreen(),
        '/confirmation': (context) => ConfirmationScreen(),
        '/signup': (context) => SignUpScreen(),
      },
    );
  }
}
