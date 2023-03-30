import 'package:bookish/screens/login_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bookish/resources/styledText.dart';
import 'package:bookish/resources/firebase.dart';

class SignupScreen extends StatefulWidget {
  static const String id = 'signup_screen';

  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _nameTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sign Up',
          style: styledText(20),
        ),
      ),
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
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Name',
                    style: styledText(20),
                  ),
                ),
                inputTextField(_nameTextController, false),
                const SizedBox(
                  height: 15.0,
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
                  height: 50.0,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                        email: _emailTextController.text,
                        password: _passwordTextController.text,
                      )
                          .then((value) {
                        FirebaseFirestore.instance
                            .collection(getCurrentUID())
                            .doc('userDetails')
                            .set({
                          'name': _nameTextController.text,
                          'email': _emailTextController.text,
                        });
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            LoginScreen.id, (Route<dynamic> route) => false);
                      });
                    },
                    child: Text(
                      'Sign up',
                      style: styledText(20.0).copyWith(
                        color: Colors.white,
                      ),
                    ),
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
