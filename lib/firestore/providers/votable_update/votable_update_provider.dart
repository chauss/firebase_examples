import 'package:firebase_examples/firestore/providers/votable_update/votable_update_notifier.dart';
import 'package:firebase_examples/typedefs/is_loading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final votableUpdateProvider =
    StateNotifierProvider<VotableUpdateNotifier, IsLoading>(
  (ref) => VotableUpdateNotifier(),
);
