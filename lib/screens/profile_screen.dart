import 'package:bookish/screens/login_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bookish/resources/styledText.dart';
import 'package:bookish/resources/firebase.dart';

class ProfileScreen extends StatefulWidget {
  static const String id = 'profile_screen';
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final query = FirebaseFirestore.instance.collection(getCurrentUID()).where("isBookLiked", isEqualTo: "true");

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
              MediaQuery.of(context).size.height * 0.05,
              20,
              MediaQuery.of(context).size.height * 0.1,
            ),
            child: Column(
              children: [
                Text(
                  'Profile',
                  style: styledText(25),
                ),
                const Icon(
                  Icons.account_circle_rounded,
                  size: 250.0,
                  color: Colors.black54,
                ),
                Text(
                  getCurrentUserEmail(),
                  style: styledText(18).copyWith(
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Liked books:',
                    style: styledText(20),
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  height: 350,
                  width: MediaQuery.of(context).size.width * 0.95,
                  color: Colors.grey.shade300,
                  child: const Center(
                    child: Text('//GridView with 3 rows'),
                  ),
                ),
                const SizedBox(
                  height: 25,
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
                      FirebaseAuth.instance.signOut().then((value) {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            LoginScreen.id, (Route<dynamic> route) => false);
                      });
                    },
                    child: Text('Log out', style: styledText(20.0)),
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
