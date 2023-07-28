import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_examples/firestore/models/votables_key.dart';

class Votable {
  final String votableId;
  final String name;
  final int votes;
  final DateTime createdAt;

  const Votable(
    String voteableId, {
    required this.name,
    required this.votes,
    required this.createdAt,
  }) : votableId = voteableId;

  factory Votable.fromJson(String voteableId, Map<String, dynamic> json) {
    return Votable(
      voteableId,
      name: json[VotablesKey.name],
      votes: json[VotablesKey.votes],
      createdAt: (json[VotablesKey.createdAt] as Timestamp).toDate(),
    );
  }
}
