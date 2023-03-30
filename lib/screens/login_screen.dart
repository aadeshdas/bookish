import 'package:bookish/screens/reset_password_screen.dart';
import 'package:bookish/screens/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bookish/resources/styledText.dart';
import 'package:bookish/resources/getLoginScreenLogo.dart';
import 'package:bookish/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              20,
              MediaQuery.of(context).size.height * 0.1,
              20,
              MediaQuery.of(context).size.height * 0.1,
            ),
            child: Column(
              children: [
                Text(
                  'Welcome Back',
                  style: styledText(30),
                ),
                const SizedBox(
                  height: 50.0,
                ),
                getLoginScreenLogo("assets/images/loginPageImage.png"),
                const SizedBox(
                  height: 50.0,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'E-mail',
                    style: styledText(20),
                  ),
                ),
                inputTextField(_emailTextController, false),
                const SizedBox(
                  height: 15.0,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Password',
                    style: styledText(20),
                  ),
                ),
                inputTextField(_passwordTextController, true),
                const SizedBox(
                  height: 5.0,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    child: Text(
                      'Forgot password?',
                      style: styledText(18).copyWith(
                        color: Colors.black54,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, ResetpasswordScreen.id);
                    },
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                        email: _emailTextController.text,
                        password: _passwordTextController.text,
                      )
                          .then((value) {
                        Navigator.pushNamed(context, HomeScreen.id);
                      }).onError((error, stackTrace) {
                        print('Error: ${error.toString()}');
                      });
                    },
                    child: Text(
                      'Login',
                      style: styledText(20.0).copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Text(
                  'Don\'t have account with us',
                  style: styledText(18).copyWith(
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        side: const BorderSide(
                          width: 2.0,
                        ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, SignupScreen.id);
                    },
                    child: Text('Sign up', style: styledText(20.0)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
