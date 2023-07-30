import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_examples/firestore/constants/firestore_collections.dart';
import 'package:firebase_examples/firestore/models/update_votable_votes_dto.dart';
import 'package:firebase_examples/firestore/models/votable.dart';
import 'package:firebase_examples/firestore/models/create_votable_dto.dart';
import 'package:firebase_examples/firestore/typedefs/votable_id.dart';
import 'package:firebase_examples/typedefs/is_loading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';

class VotableUpdateNotifier extends StateNotifier<IsLoading> {
  static final log = Logger('VotableUpdateNotifier');

  VotableUpdateNotifier() : super(false);

  set isLoading(bool value) => state = value;

  Future<bool> decreaseVotes(Votable votable) async {
    isLoading = true;
    final couldUpdate = _update(votable.votableId, Voting.decrease);
    isLoading = false;
    return couldUpdate;
  }

  Future<bool> increaseVotes(Votable votable) async {
    isLoading = true;
    final couldUpdate = _update(votable.votableId, Voting.increase);
    isLoading = false;
    return couldUpdate;
  }

  Future<bool> addVotable(CreateVotableDTO votablePayload) async {
    isLoading = true;

    final couldAdd = _add(votablePayload);

    isLoading = false;
    return couldAdd;
  }

  Future<bool> _update(VotableId votableId, Voting voting) async {
    final doc = FirebaseFirestore.instance
        .collection(FirestoreCollections.votables)
        .doc(votableId);
    try {
      doc.update(IncreaseVotableVotesDTO(voting: voting));
    } catch (error) {
      log.warning("Error while updating Votable: $error");
      return false;
    }
    return true;
  }

  Future<bool> _add(CreateVotableDTO votablePayload) async {
    final ref =
        FirebaseFirestore.instance.collection(FirestoreCollections.votables);
    try {
      ref.add(votablePayload);
    } catch (error) {
      log.warning("Error while adding VotablePayload: $error");
      return false;
    }
    return true;
  }
}
