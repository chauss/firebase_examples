import 'package:flutter/foundation.dart' show immutable;

@immutable
class VotablesKey {
  static const name = "name";
  static const votes = "votes";
  static const createdAt = "created_at";

  const VotablesKey._();
}
