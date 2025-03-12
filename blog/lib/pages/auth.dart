import 'package:flutter/material.dart';
import '../components/login_form.dart';
import '../components/signup_form.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: CustomScrollView(
          physics: ClampingScrollPhysics(),
          slivers: [
            SliverAppBar(
              expandedHeight: 120,
              floating: false,
              pinned: true,
              backgroundColor: Colors.transparent,
              flexibleSpace: FlexibleSpaceBar(
                background: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Image.asset('lib/assets/logo.png', scale: 1.8)],
                ),
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF2991D6),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              if (!isLogin) {
                                setState(() {
                                  isLogin = true;
                                });
                              }
                            },
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              margin: EdgeInsets.only(
                                left: 30,
                                top: 15,
                                bottom: 15,
                              ),
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: AnimatedSlide(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeOutCubic,
                                  offset: Offset(isLogin ? 0 : 0.2, 0),
                                  child: AnimatedOpacity(
                                    duration: const Duration(milliseconds: 300),
                                    opacity: isLogin ? 1 : 0.5,
                                    child: Text(
                                      'LOGIN',
                                      style: TextStyle(
                                        fontFamily: 'Avenir',
                                        fontWeight: FontWeight.bold,
                                        color:
                                            isLogin
                                                ? Colors.white
                                                : const Color(0xFF5DA9DE),
                                        fontSize: 22,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              if (isLogin) {
                                setState(() {
                                  isLogin = false;
                                });
                              }
                            },
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              margin: EdgeInsets.only(
                                right: 30,
                                top: 15,
                                bottom: 15,
                              ),
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: AnimatedSlide(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeOutCubic,
                                  offset: Offset(!isLogin ? 0 : -0.2, 0),
                                  child: AnimatedOpacity(
                                    duration: const Duration(milliseconds: 300),
                                    opacity: !isLogin ? 1 : 0.5,
                                    child: Text(
                                      'SIGN UP',
                                      style: TextStyle(
                                        fontFamily: 'Avenir',
                                        fontWeight: FontWeight.bold,
                                        color:
                                            isLogin
                                                ? const Color(0xFF5DA9DE)
                                                : Colors.white,
                                        fontSize: 22,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFFFFF),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(32),
                            topRight: Radius.circular(32),
                          ),
                        ),
                        child: SingleChildScrollView(
                          physics: ClampingScrollPhysics(),
                          child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 300),
                            child:
                                isLogin
                                    ? const LoginForm()
                                    : const SignUpForm(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
