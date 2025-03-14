import 'package:flutter/material.dart';
import 'sign_in.dart'; // Import SignIn screen
// ignore: unused_import
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Sign_up extends StatelessWidget {
  const Sign_up({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView( // 🔥 Fix Overflow Issue
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 80),

              // 🌟 Create New Account Title
              const Center(
                child: Text(
                  "Create New Account",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // 🔹 Full Name Field
              formLabel("Full Name"),
              textField("Enter Your Full Name"),

              const SizedBox(height: 15),

              // 🔒 Password Field
              formLabel("Password"),
              textField("Enter Your Password", isPassword: true),

              const SizedBox(height: 15),

              // 📨 Email Field
              formLabel("Email"),
              textField("Enter Your Email"),

              const SizedBox(height: 15),

              // 📞 Mobile Number Field
              formLabel("Mobile Number"),
              textField("Enter Your Phone Number"),

              const SizedBox(height: 20),

              // 🔵 Sign Up Button
                        // 🔵 Sign In Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/Home',
                    ); // Navigate to details

                    // TODO: Sign in logic
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "Sign up",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // 🔹 OR Divider
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(width: 60, height: 1, color: Colors.grey),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text("OR"),
                  ),
                  Container(width: 60, height: 1, color: Colors.grey),
                ],
              ),

              const SizedBox(height: 20),

              // 🔵 Social Login (Facebook & Google)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Facebook Button
                  socialLoginButton(FontAwesomeIcons.facebook, Colors.blue),

                  const SizedBox(width: 20),

                  // Google Button
                  socialLoginButton(FontAwesomeIcons.google, Colors.red),
                ],
              ),

              const SizedBox(height: 20),

              // 🔸 Already have an account? Sign In
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Do you have an account? "),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Sign_in(), // 🔥 Fix navigation
                          ),
                        );
                      },
                      child: const Text(
                        "Sign in",
                        style: TextStyle(
                          color: Colors.teal,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20), // Extra spacing to prevent cutting off content
            ],
          ),
        ),
      ),
    );
  }

  // 🔹 Form Label
  Widget formLabel(String text) {
    return Text(
      text,
      style: const TextStyle(fontWeight: FontWeight.bold),
    );
  }

  // 🔸 Input Field
  Widget textField(String hint, {bool isPassword = false}) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        suffixIcon: isPassword
            ? const Icon(Icons.visibility_off, color: Colors.teal)
            : null,
      ),
    );
  }
}
// 🔹 Social Login Button
Widget socialLoginButton(IconData icon, Color color) {
  return Container(
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(color: Colors.grey.shade300),
    ),
    child: Icon(icon, color: color, size: 28),
  );
}
