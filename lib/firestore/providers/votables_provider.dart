import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_examples/firestore/models/votables_key.dart';
import 'package:firebase_examples/firestore/models/votable.dart';
import 'package:firebase_examples/firestore/constants/firestore_collections.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final votablesProvider = StreamProvider.autoDispose<Iterable<Votable>>((ref) {
  final controller = StreamController<Iterable<Votable>>();

  controller.onListen = () {
    controller.sink.add([]);
  };

  final sub = FirebaseFirestore.instance
      .collection(FirestoreCollections.votables)
      .orderBy(VotablesKey.name)
      // NOTE: This enforces a second update after the metadata changes have been completed
      .snapshots(includeMetadataChanges: true)
      .listen((snapshot) {
    final documents = snapshot.docs;
    // NOTE: Don't update the UI when some docs have pending writes
    if (documents.where((doc) => doc.metadata.hasPendingWrites).isEmpty) {
      final votables = documents
          .where((doc) => !doc.metadata.hasPendingWrites)
          .map((doc) => Votable.fromJson(doc.id, doc.data()))
          .toList();
      controller.sink.add(votables);
    }
  });

  ref.onDispose(() {
    sub.cancel();
    controller.close();
  });

  return controller.stream;
});
