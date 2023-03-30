import 'package:bookish/resources/styledText.dart';
import 'package:flutter/material.dart';

class SeeallScreen extends StatefulWidget {
  static const String id = 'seeall_screen';

  const SeeallScreen({Key? key}) : super(key: key);
  @override
  State<SeeallScreen> createState() => _SeeallScreenState();
}

class _SeeallScreenState extends State<SeeallScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'All books:',
          style: styledText(20.0),
        ),
      ),
      body: const Center(child: Text('//Grid View 3x3')),
    );
  }
}
