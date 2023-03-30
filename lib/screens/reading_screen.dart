import 'package:flutter/material.dart';
import '../resources/styledText.dart';

class ReadingScreen extends StatefulWidget {
  static const String id = 'reading _screen';
  const ReadingScreen({Key? key}) : super(key: key);

  @override
  State<ReadingScreen> createState() => _ReadingScreenState();
}

class _ReadingScreenState extends State<ReadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sample pdf:',
          style: styledText(20.0),
        ),
      ),
      body: const Center(
        child: Text('Show pdf'),
      ),
    );
  }
}
