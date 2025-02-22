import 'package:flutter/material.dart';

class ConfirmationScreen extends StatelessWidget {
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

                // Header with Back Button and Logo
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              color: Colors.black26, // First shadow (darker)
                              blurRadius: 6,
                              offset: Offset(0, 3),
                            ),
                            BoxShadow(
                              color: Colors.blue.withOpacity(0.3), // Second shadow (lighter)
                              blurRadius: 8,
                              offset: Offset(2, 4),
                            ),
                          ],
                        ),
                        child: const Icon(Icons.chevron_left, color: Colors.white, size: 28),
                      ),
                    ),

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

                const SizedBox(height: 35),

                // Title and Subtitle
                Center(
                  child: Column(
                    children: const [
                      Text(
                        "Enter confirmation code",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "A 4-digit code was sent to\nlucasscott3@email.com",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                // OTP Input Fields
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(4, (index) => _buildOTPField(index == 0)),
                ),

                const SizedBox(height: 20),


                Text(
                  "Resend code",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: Colors.blue),
                ),
                SizedBox(height: 30),

                // Continue Button
                Center(
                  child: _buildGradientButton(
                    text: "Continue",
                    onTap: () {
                      // Handle OTP verification
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // OTP Field with first field blue border
  Widget _buildOTPField(bool isFirst) {
    return Container(
      width: 50,
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        border: Border.all(color: isFirst ? Colors.blue : Colors.grey, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        keyboardType: TextInputType.number,
        maxLength: 1,
        decoration: const InputDecoration(
          counterText: "",
          border: InputBorder.none,
        ),
      ),
    );
  }

  // Gradient Button for Continue
  Widget _buildGradientButton({required String text, required VoidCallback onTap}) {
    return Container(
      width: 250,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(
          colors: [Color(0xFF34C8E8), Color(0xFF4E4AF2)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: 6, offset: Offset(0, 3)),
        ],
      ),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}