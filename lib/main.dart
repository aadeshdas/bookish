import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:bookish/screens/home_screen.dart';
import 'package:bookish/screens/login_screen.dart';
import 'package:bookish/screens/profile_screen.dart';
import 'package:bookish/screens/reading_screen.dart';
import 'package:bookish/screens/reset_password_screen.dart';
import 'package:bookish/screens/see_all_screen.dart';
import 'package:bookish/screens/signup_screen.dart';
import 'package:bookish/screens/upload_screen.dart';
import 'package:bookish/screens/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Bookish());
}

class Bookish extends StatefulWidget {
  const Bookish({Key? key}) : super(key: key);

  @override
  State<Bookish> createState() => _BookishState();
}

class _BookishState extends State<Bookish> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.grey,
        fontFamily: 'Oswald',
      ),
      initialRoute: WelcomeScreen.id,

      routes: {
        HomeScreen.id: (context) => const HomeScreen(),
        LoginScreen.id: (context) => const LoginScreen(),
        ProfileScreen.id: (context) => const ProfileScreen(),
        ReadingScreen.id: (context) => const ReadingScreen(),
        ResetpasswordScreen.id: (context) => const ResetpasswordScreen(),
        SeeallScreen.id: (context) => const SeeallScreen(),
        SignupScreen.id: (context) => const SignupScreen(),
        UploadScreen.id: (context) => const UploadScreen(),
        WelcomeScreen.id: (context) => const WelcomeScreen(),
      },
    );
  }
}
