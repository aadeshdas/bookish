import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:bookish/resources/styledText.dart';
import 'package:bookish/resources/firebase.dart';

class UploadScreen extends StatefulWidget {
  static const String id = 'upload_screen';
  const UploadScreen({Key? key}) : super(key: key);

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  FilePickerResult? result;
  String? _initialTextField = 'Select book to upload';
  final TextEditingController _bookWriterTextController =
      TextEditingController();
  final TextEditingController _bookCategoryTextController =
      TextEditingController();
  final TextEditingController _bookDescriptionTextController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Upload book',
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
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.75,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: const BorderSide(
                        width: 2.0,
                      ),
                    ),
                    onPressed: () async {
                      result = await FilePicker.platform.pickFiles(
                        allowMultiple: false,
                        type: FileType.custom,
                        allowedExtensions: ['pdf'],
                      );
                    },
                    child: Text(
                      _initialTextField!,
                      style: styledText(20.0),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Writer name',
                    style: styledText(20),
                  ),
                ),
                inputTextField(_bookWriterTextController, false),
                const SizedBox(
                  height: 15.0,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Book category',
                    style: styledText(20),
                  ),
                ),
                inputTextField(_bookCategoryTextController, false),
                const SizedBox(
                  height: 15.0,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Book description',
                    style: styledText(20),
                  ),
                ),
                inputTextField(_bookDescriptionTextController, false),
                const SizedBox(
                  height: 50.0,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (result != null) {
                        File file = File(result!.files.single.path!);
                        String fileName = result!.names.first.toString();
                        UploadTask task = await uploadToFirebase(
                          file,
                          fileName,
                          _bookWriterTextController.text,
                          _bookCategoryTextController.text,
                          _bookDescriptionTextController.text,
                        );
                        task.whenComplete(() {
                          Navigator.of(context).pop();
                        });
                      }
                    },
                    child: Text(
                      'Upload to cloud storage',
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
