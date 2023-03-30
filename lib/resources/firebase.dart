import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

String getCurrentUID() {
  return (FirebaseAuth.instance.currentUser)?.uid as String;
}

String getCurrentUserEmail() {
  return (FirebaseAuth.instance.currentUser)?.email as String;
}

Future<UploadTask> uploadToFirebase(
  File file,
  String fileName,
  String writer,
  String category,
  String description,
) async {
  Reference refer =
      FirebaseStorage.instance.ref().child(getCurrentUID()).child(fileName);
  UploadTask uploadTask = refer.putFile(file);
  TaskSnapshot snapshot = await uploadTask;
  String url = await snapshot.ref.getDownloadURL();
  FirebaseFirestore.instance.collection(getCurrentUID()).doc(fileName).set({
    'bookName': fileName,
    'bookWriter': writer,
    'bookCategory': category,
    'bookDescription': description,
    'bookUploadDateTime': DateTime.now(),
    'bookAccessDateTime': null,
    'isBookLiked': false,
    'bookLikeDateTime ': null,
    'bookUrl': url,
  });
  return uploadTask;
}
