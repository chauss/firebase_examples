import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_examples/firestore/models/votable.dart';
import 'package:firebase_examples/firestore/models/votables_key.dart';

class VotablePayload extends MapView<String, dynamic> {
  VotablePayload({
    required String name,
    required int votes,
  }) : super({
          VotablesKey.name: name,
          VotablesKey.votes: votes,
          VotablesKey.createdAt: FieldValue.serverTimestamp()
        });

  factory VotablePayload.fromVotable(Votable votable) {
    return VotablePayload(
      name: votable.name,
      votes: votable.votes,
    );
  }
}
