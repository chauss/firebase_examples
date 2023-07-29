import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_examples/firestore/models/votables_key.dart';

enum Voting { increase, decrease }

class IncreaseVotableVotesDTO extends MapView<String, dynamic> {
  IncreaseVotableVotesDTO({
    required Voting voting,
  }) : super({
          VotablesKey.votes:
              FieldValue.increment(voting == Voting.increase ? 1 : -1),
        });
}
