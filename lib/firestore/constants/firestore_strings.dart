import 'package:flutter/foundation.dart' show immutable;

@immutable
class FirestoreStrings {
  static const String title = "Firestore";
  static const String errorOnLoadingVotables =
      "Could not load votables. Please try again later 🥲";
  static const String noVotablesYet =
      "There are no votables yet. Go start create the first!";
  static const String addNewVotableButtonText = "Add";
  static const String addNewVotableTextFieldPlaceholder =
      "New thing to vote on";

  const FirestoreStrings._();
}
