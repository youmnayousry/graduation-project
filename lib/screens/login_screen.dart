import 'package:flutter/material.dart';
import 'password_screen.dart'; // Ensure this file exists and contains ForgotPasswordScreen

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 24),

                // Header Row with Title and Logo
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Welcome\nBack!",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 80,
                      child: Image.asset(
                        'assets/logo2.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 40),

                _buildInputField(
                  icon: Icons.person,
                  hintText: "Username or Email",
                  obscureText: false,
                ),

                SizedBox(height: 16),

                _buildInputField(
                  icon: Icons.lock,
                  hintText: "**********",
                  obscureText: true,
                ),

                SizedBox(height: 20),

                // Forgot Password
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ForgotPasswordScreen(), // Ensure this screen exists
                        ),
                      );
                    },
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ),

                SizedBox(height: 150),

                // Login Button
                Center(child: _buildLoginButton()),

                SizedBox(height: 15),

                Center(child: Text("- OR -")),

                SizedBox(height: 15),

                Center(child: _buildGoogleLoginButton()),

                SizedBox(height: 30),

                // Sign Up Option
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Create An Account "),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/signup');
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputField({required IconData icon, required String hintText, required bool obscureText}) {
    return Container(
      height: 52,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: Colors.grey.shade300, width: 1.5),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3)),
          BoxShadow(color: Colors.blue.withOpacity(0.1), blurRadius: 10, offset: Offset(2, 4)),
          BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 12, offset: Offset(-2, -2)),
        ],
      ),
      child: TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          prefixIcon: Icon(icon, color: Colors.blue),
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 10),
        ),
      ),
    );
  }

  Widget _buildLoginButton() {
    return Container(
      width: 250,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(colors: [Color(0xFF196EEE), Color(0xFF34C8E8)]),
        boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, 3)),
          BoxShadow(color: Colors.blue.withOpacity(0.1), blurRadius: 10, offset: Offset(2, 4)),
          BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 12, offset: Offset(-2, -2)),
        ],
      ),
      child: ElevatedButton(
        onPressed: () {
          print("Login Pressed");
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
        child: Text(
          "Login",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildGoogleLoginButton() {
    return Container(
      width: 250,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300, width: 1.5),
        boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, 3)),
          BoxShadow(color: Colors.blue.withOpacity(0.1), blurRadius: 10, offset: Offset(2, 4)),
          BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 12, offset: Offset(-2, -2)),
        ],
      ),
      child: ElevatedButton(
        onPressed: () {
          print("Google Login Pressed");
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/google.png', height: 24),
            SizedBox(width: 10),
            Text(
              "Login with Google",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}