import 'package:firebase_examples/firestore/constants/firestore_strings.dart';
import 'package:firebase_examples/firestore/widgets/add_votable_widget.dart';
import 'package:firebase_examples/firestore/widgets/votables_list_widget.dart';
import 'package:flutter/material.dart';

class FirestorePage extends StatelessWidget {
  const FirestorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(FirestoreStrings.title),
      ),
      body: Column(
        children: [
          const SizedBox(height: 30),
          AddVotableWidget(),
          const SizedBox(height: 30),
          const VotablesListWidget(),
        ],
      ),
    );
  }
}
