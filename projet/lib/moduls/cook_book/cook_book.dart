import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeView5 extends StatelessWidget {
  const HomeView5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final example = ExampleClass();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Example App'),
      ),
      body: Center(
        child: FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
          future: example.postDocumentsList,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }

            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }

            if (snapshot.hasData) {
              final data = snapshot.data!.docs.first
                  .data(); // Get the data of the first document

              final calories =
                  data['calories']; // Get the value of the "calories" field

              // Do something with the calories value
              return Text('Calories: $calories');
            }

            // No data yet
            return const Text('No data');
          },
        ),
      ),
    );
  }
}

class ExampleClass {
  final currentUser = FirebaseAuth.instance;
  String current = FirebaseAuth.instance.currentUser!.uid;
  Future<QuerySnapshot<Map<String, dynamic>>>? postDocumentsList;

  ExampleClass() {
    current = currentUser.currentUser!.uid;
    postDocumentsList = FirebaseFirestore.instance
        .collection("users")
        .where("uid", isEqualTo: current)
        .get();
  }
}
