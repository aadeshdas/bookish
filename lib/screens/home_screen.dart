import 'package:bookish/screens/profile_screen.dart';
import 'package:bookish/screens/see_all_screen.dart';
import 'package:bookish/screens/upload_screen.dart';
import 'package:flutter/material.dart';
import 'package:bookish/resources/styledText.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Welcome...',
          style: styledText(20),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.account_circle_rounded,
            ),
            onPressed: () {
              Navigator.pushNamed(context, ProfileScreen.id);
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, UploadScreen.id);
        },
        child: const Icon(Icons.cloud_upload_outlined),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              5,
              MediaQuery.of(context).size.height * 0.01,
              5,
              MediaQuery.of(context).size.height * 0.01,
            ),
            child: Column(
              children: [
                Container(
                  height: 250,
                  width: MediaQuery.of(context).size.width * 0.95,
                  color: Colors.grey.shade300,
                  child: const Center(
                    child: Text('//Carousel area'),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Category',
                      style: styledText(15),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, SeeallScreen.id);
                      },
                      style: const ButtonStyle(
                      ),
                      child: Text('See All', style: styledText(15.0),),
                    ),
                  ],
                ),
                Container(
                  height: 150,
                  width: MediaQuery.of(context).size.width * 0.95,
                  color: Colors.grey.shade300,
                  child: const Center(
                    child: Text('//GridView'),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Category',
                      style: styledText(15),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, SeeallScreen.id);
                      },
                      style: const ButtonStyle(
                      ),
                      child: Text('See All', style: styledText(15.0),),
                    ),
                  ],
                ),
                Container(
                  height: 150,
                  width: MediaQuery.of(context).size.width * 0.95,
                  color: Colors.grey.shade300,
                  child: const Center(
                    child: Text('//GridView'),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Category',
                      style: styledText(15),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, SeeallScreen.id);
                      },
                      style: const ButtonStyle(
                      ),
                      child: Text('See All', style: styledText(15.0),),
                    ),
                  ],
                ),
                Container(
                  height: 150,
                  width: MediaQuery.of(context).size.width * 0.95,
                  color: Colors.grey.shade300,
                  child: const Center(
                    child: Text('//GridView'),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Category',
                      style: styledText(15),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, SeeallScreen.id);
                      },
                      style: const ButtonStyle(
                      ),
                      child: Text('See All', style: styledText(15.0),),
                    ),
                  ],
                ),
                Container(
                  height: 150,
                  width: MediaQuery.of(context).size.width * 0.95,
                  color: Colors.grey.shade300,
                  child: const Center(
                    child: Text('//GridView'),
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
