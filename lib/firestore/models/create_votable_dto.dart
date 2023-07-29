import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_examples/firestore/models/votable.dart';
import 'package:firebase_examples/firestore/models/votables_key.dart';

class CreateVotableDTO extends MapView<String, dynamic> {
  CreateVotableDTO({
    required String name,
    required int votes,
  }) : super({
          VotablesKey.name: name,
          VotablesKey.votes: votes,
          VotablesKey.createdAt: FieldValue.serverTimestamp()
        });

  factory CreateVotableDTO.fromVotable(Votable votable) {
    return CreateVotableDTO(
      name: votable.name,
      votes: votable.votes,
    );
  }
}
