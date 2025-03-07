import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool showPassword = false;
  final _formKey = GlobalKey<FormState>();

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
                'Welcome back',
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
                'Sign in with your account',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Avenir',
                  color: const Color(0xFF2D4379),
                ),
              ),
            ),
            SizedBox(height: 40),

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
                fontWeight: FontWeight.bold,
                fontFamily: 'Avenir',
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
            SizedBox(height: 28),

            InkWell(
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  // TODO: Implement login logic
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
                    'Login',
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Forgot your password? ',
                  style: TextStyle(fontFamily: 'Avenir', fontSize: 16),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    'Reset here',
                    style: TextStyle(
                      fontFamily: 'Avenir',
                      fontSize: 16,
                      color: Color(0xFF2991D6),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Or sign in with',
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
          ],
        ),
      ),
    );
  }
}
