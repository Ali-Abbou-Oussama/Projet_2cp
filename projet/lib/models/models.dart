import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ExampleClass {
  final currentUser = FirebaseAuth.instance;
  String current = "";
  Future<QuerySnapshot<Map<String, dynamic>>>? postDocumentsList;

  ExampleClass() {
    current = currentUser.currentUser!.uid;
    postDocumentsList = FirebaseFirestore.instance
        .collection("users")
        .where("uid", isEqualTo: current)
        .get();
  }
}
