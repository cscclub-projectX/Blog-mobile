import 'package:flutter/material.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool showPassword = false;
  bool showConfirmPassword = false;
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(32),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Create Account',
                style: TextStyle(
                  fontSize: 28,
                  fontFamily: 'Avenir',
                  color: Color(0xFF0D253C),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 16),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Sign up to get started',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Avenir',
                  color: const Color(0xFF2D4379),
                ),
              ),
            ),
            SizedBox(height: 40),

            // Full Name field
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Full Name',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Avenir',
                  color: const Color(0xFF2D4379),
                ),
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF2991D6), width: 2.0),
                ),
                border: UnderlineInputBorder(),
              ),
              style: TextStyle(
                fontFamily: 'Avenir',
                fontWeight: FontWeight.bold,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your full name';
                }
                return null;
              },
            ),
            SizedBox(height: 24),

            // Phone Number field
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Phone Number',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Avenir',
                  color: const Color(0xFF2D4379),
                ),
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF2991D6), width: 2.0),
                ),
                border: UnderlineInputBorder(),
              ),
              style: TextStyle(
                fontFamily: 'Avenir',
                fontWeight: FontWeight.bold,
              ),
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your phone number';
                }
                if (!RegExp(r'^\+?[\d\s-]+$').hasMatch(value)) {
                  return 'Please enter a valid phone number';
                }
                return null;
              },
            ),
            SizedBox(height: 24),

            // Email field
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Email',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Avenir',
                  color: const Color(0xFF2D4379),
                ),
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF2991D6), width: 2.0),
                ),
                border: UnderlineInputBorder(),
              ),
              style: TextStyle(
                fontFamily: 'Avenir',
                fontWeight: FontWeight.bold,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                if (!RegExp(
                  r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                ).hasMatch(value)) {
                  return 'Please enter a valid email';
                }
                return null;
              },
            ),
            SizedBox(height: 24),

            // Password field
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Password',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Avenir',
                  color: const Color(0xFF2D4379),
                ),
              ),
            ),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF2991D6), width: 2.0),
                ),
                border: UnderlineInputBorder(),
                suffixIcon: TextButton(
                  child: Text(
                    showPassword ? 'Hide' : 'Show',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF2991D6),
                      fontFamily: 'Avenir',
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                ),
              ),
              style: TextStyle(
                fontFamily: 'Avenir',
                fontWeight: FontWeight.bold,
              ),
              obscureText: !showPassword,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                if (value.length < 6) {
                  return 'Password must be at least 6 characters';
                }
                return null;
              },
            ),
            SizedBox(height: 24),

            // Confirm Password field
            

            // Sign Up Button
            InkWell(
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  // TODO: Implement sign up logic
                  
                }
              },
              child: Container(
                margin: EdgeInsets.all(12),
                padding: EdgeInsets.all(20),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFF2991D6),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 22,
                      fontFamily: 'Avenir',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),

            // Social Sign Up Section
            Text(
              'Or sign up with',
              style: TextStyle(
                fontFamily: 'Avenir',
                fontSize: 16,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Google
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: Image.asset('lib/assets/google.png', height: 40),
                  ),
                ),
                SizedBox(width: 25),
                // Facebook
                GestureDetector(
                  onTap: () {},
                  child: Image.asset('lib/assets/facebook.png', height: 40),
                ),
                SizedBox(width: 25),
                // Twitter
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: Image.asset('lib/assets/twitter.png', height: 40),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
