import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_examples/firestore/constants/firestore_collections.dart';
import 'package:firebase_examples/firestore/models/votable.dart';
import 'package:firebase_examples/firestore/models/votable_payload.dart';
import 'package:firebase_examples/firestore/models/votables_key.dart';
import 'package:firebase_examples/firestore/typedefs/votable_id.dart';
import 'package:firebase_examples/typedefs/is_loading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VotableUpdateNotifier extends StateNotifier<IsLoading> {
  VotableUpdateNotifier() : super(false);

  set isLoading(bool value) => state = value;

  Future<bool> decreaseVotes(Votable votable) async {
    isLoading = true;
    final couldUpdate = _update(votable.votableId, votable.votes - 1);
    isLoading = false;
    return couldUpdate;
  }

  Future<bool> increaseVotes(Votable votable) async {
    isLoading = true;
    final couldUpdate = _update(votable.votableId, votable.votes + 1);
    isLoading = false;
    return couldUpdate;
  }

  Future<bool> addVotable(VotablePayload votablePayload) async {
    isLoading = true;

    final couldAdd = _add(votablePayload);

    isLoading = false;
    return couldAdd;
  }

  Future<bool> _update(VotableId votableId, int votes) async {
    final doc = FirebaseFirestore.instance
        .collection(FirestoreCollections.votables)
        .doc(votableId);
    try {
      doc.update({VotablesKey.votes: votes});
    } catch (error) {
      print("Error while updating Votable: $error");
      return false;
    }
    return true;
  }

  Future<bool> _add(VotablePayload votablePayload) async {
    final ref =
        FirebaseFirestore.instance.collection(FirestoreCollections.votables);
    try {
      ref.add(votablePayload);
    } catch (error) {
      print("Error while adding VotablePayload: $error");
      return false;
    }
    return true;
  }
}
