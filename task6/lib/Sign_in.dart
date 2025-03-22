import 'package:flutter/material.dart';
import 'sign_up.dart'; // Import SignIn screen
// ignore: unused_import
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Sign_in extends StatelessWidget {
  const Sign_in({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        // Wrap the body with a SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 80),

              // 🌟 Welcome Text
              const Center(
                child: Text(
                  "Welcome",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // 🔹 Sign In Title
              const Text(
                "Sign In",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 5),

              // 🔸 Description
              const Text(
                "Korem ipsum dolor sit amet, consectetur adipiscing elit.",
                style: TextStyle(color: Colors.grey),
              ),

              const SizedBox(height: 20),

              // 📨 Email Field
              textField("Email", "Enter Your Email"),

              const SizedBox(height: 15),

              // 🔒 Password Field
              textField("Password", "Enter Your Password", isPassword: true),

              const SizedBox(height: 10),

              // ❓ Forget Password
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Forget Password",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

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
                    "Sign In",
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

              // 🔸 Don't have an account? Sign Up
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don’t have an account? "),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Sign_up(),
                          ),
                        );
                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.teal,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 🔹 Text Field Widget
  Widget textField(String label, String hint, {bool isPassword = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        TextField(
          obscureText: isPassword,
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: Colors.grey[200],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            suffixIcon:
                isPassword
                    ? const Icon(Icons.visibility_off, color: Colors.teal)
                    : null,
          ),
        ),
      ],
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
    child: FaIcon(
      // Use FaIcon instead of Icon for FontAwesome icons
      icon,
      color: color,
      size: 20,
    ),
  );
}
