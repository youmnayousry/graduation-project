import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();

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
                Stack(
                  children: [
// Header with Back Button, Title, and Logo
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center, // Aligns items properly
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
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 6,
                                  offset: Offset(0, 3),
                                ),
                                BoxShadow(
                                  color: Colors.blue.withOpacity(0.3),
                                  blurRadius: 8,
                                  offset: Offset(2, 4),
                                ),
                              ],
                            ),
                            child: const Icon(Icons.chevron_left, color: Colors.white, size: 28),
                          ),
                        ),

                        SizedBox(width: 8), // Reduced space between back button and title

                        // Title
                        Text(
                          "Forget\nPassword !",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),

                        Spacer(), // Pushes the logo to the right

                        // Logo (Aligned to the right)
                        SizedBox(
                          height: 80,
                          child: Image.asset(
                            'assets/logo2.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),


                    // Logo moved to the top right
                    Align(
                      alignment: Alignment.topRight, // Ensures it stays on the far right

                      // Adjust right padding for more spacing
                      child: SizedBox(
                        height: 80,
                        child: Image.asset(
                          'assets/logo2.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),

                  ],
                ),

                const SizedBox(height: 30),
                _buildInputField(Icons.email, "Enter your email address"),
                const SizedBox(height: 20),

                // Fixed Text Widget
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "* ",
                        style: TextStyle(color: Colors.red[300], fontSize: 14),
                      ),
                      TextSpan(
                        text: "We will send you a message to set or reset your new password",
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 60),
                Center(child: _buildContinueButton(context)),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(IconData icon, String hintText) {
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
        controller: _emailController,
        keyboardType: TextInputType.emailAddress,
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

  Widget _buildContinueButton(BuildContext context) {
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
          Navigator.pushNamed(context, '/confirmation');
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
        child: Text(
          "Continue",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}