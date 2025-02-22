import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
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
                const SizedBox(height: 24),

// Header with Back Button and Title
                Row(
                  children: [
                    // Back Button
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: const LinearGradient(
                            colors: [Color(0xFF34C8E8), Color(0xFF4E4AF2)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          boxShadow: [
                            BoxShadow(color: Colors.black26, blurRadius: 6, offset: Offset(0, 3)),
                            BoxShadow(color: Colors.blue.withOpacity(0.3), blurRadius: 8, offset: Offset(2, 4)),
                          ],
                        ),
                        child: const Icon(Icons.chevron_left, color: Colors.white, size: 28),
                      ),
                    ),
                    const SizedBox(width: 15), // Small spacing between button and text

                    // Title with one line
                    Expanded(
                      child: Text(
                        "Create an Account",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),

                    // Ensure spacing between title and logo
                    const SizedBox(width: 10),

                    // Logo
                    SizedBox(
                      height: 80,
                      child: Image.asset(
                        'assets/logo2.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),



                const SizedBox(height: 30),
                _buildInputField(Icons.person, "Full Name", false),
                const SizedBox(height: 16),
                _buildInputField(Icons.email, "Email", false),
                const SizedBox(height: 16),
                _buildInputField(Icons.lock, "Password", true),
                const SizedBox(height: 16),
                _buildInputField(Icons.lock, "Confirm Password", true),
                const SizedBox(height: 15),

                Center(
                  child: Text.rich(
                    TextSpan(
                      text: "By clicking the ",
                      children: [
                        TextSpan(
                          text: "SignUp ",
                          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
                        TextSpan(text: "button, you agree to the public offer"),
                      ],
                    ),
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ),

                const SizedBox(height: 20),
                Center(child: _buildSignUpButton(context)),
                const SizedBox(height: 20),
                Center(child: Text("- OR -", style: TextStyle(fontSize: 14))),
                const SizedBox(height: 10),
                Center(child: _buildGoogleSignUpButton()),
                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account? "),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(IconData icon, String hintText, bool obscureText) {
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

  Widget _buildSignUpButton(BuildContext context) {
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
          print("Sign Up Pressed");
          // Implement your sign-up logic here
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
        child: Text(
          "Sign Up",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }

Widget _buildGoogleSignUpButton() {
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
        print("Google SignUp Pressed");
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
            "SignUp with Google",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
          ),
        ],
      ),
    ),
  );
}
}