import 'package:bookish/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../resources/styledText.dart';

class ResetpasswordScreen extends StatefulWidget {
  static const String id = 'resetpassword_screen';
  const ResetpasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetpasswordScreen> createState() => _ResetpasswordScreenState();
}

class _ResetpasswordScreenState extends State<ResetpasswordScreen> {
  final TextEditingController _emailTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Reset Password',
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
                    'E-mail',
                    style: styledText(20),
                  ),
                ),
                inputTextField(_emailTextController, false),
                const SizedBox(
                  height: 50.0,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      FirebaseAuth.instance
                          .sendPasswordResetEmail(
                              email: _emailTextController.text)
                          .then((value) {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            LoginScreen.id, (Route<dynamic> route) => false);
                      }).onError((error, stackTrace) {
                        print('Error: ${error.toString()}');
                      });
                    },
                    child: Text(
                      'Reset password',
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
