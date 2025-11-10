import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscurePassword = true;
  bool _agree = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Logo with fallback
                Image.asset(
                  "assets/img/logo.png",
                  height: 120,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return const Text(
                      "Logo not found",
                      style: TextStyle(fontSize: 18, color: Colors.red),
                    );
                  },
                ),

                const SizedBox(height: 24),

                // Email Field
                TextField(
                  decoration: InputDecoration(
                    labelText: "Email Address",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),

                const SizedBox(height: 18),

                // Password Field
                TextField(
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text("Forgot password?"),
                  ),
                ),

                // Checkbox Agreement with clickable links
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: _agree,
                      onChanged: (value) {
                        setState(() {
                          _agree = value!;
                        });
                      },
                    ),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          text: "I've read and agreed to ",
                          style: const TextStyle(color: Colors.black, height: 1.3),
                          children: [
                            TextSpan(
                              text: "User Agreement",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const UserAgreementPage()),
                                  );
                                },
                            ),
                            const TextSpan(text: " and ", style: TextStyle(color: Colors.black)),
                            TextSpan(
                              text: "Privacy Policy",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const PrivacyPolicyPage()),
                                  );
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // Sign In Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      if (!_agree) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Please agree first.")),
                        );
                        return;
                      }

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const TestHomePage()),
                      );
                    },
                    child: const Text("Sign in"),
                  ),
                ),

                const SizedBox(height: 20),
                const Text("Other ways to sign in"),

                const SizedBox(height: 16),

                // Google & Facebook Icon Buttons (mock)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.g_mobiledata, size: 40),
                    SizedBox(width: 20),
                    Icon(Icons.facebook, size: 32, color: Colors.blue),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class TestHomePage extends StatelessWidget {
  const TestHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Welcome!")),
      body: const Center(child: Text("Login UI is working ")),
    );
  }
}


class UserAgreementPage extends StatelessWidget {
  const UserAgreementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("User Agreement")),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(18),
          child: Text(
            "Here is the User Agreement content...",
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

// Privacy Policy Page
class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Privacy Policy")),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(18),
          child: Text(
            "Here is the Privacy Policy content...",
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
