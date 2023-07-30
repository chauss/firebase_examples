import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_examples/authentication/providers/user_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userProvider = StateNotifierProvider.autoDispose<UserNotifier, User?>(
  (ref) => UserNotifier(),
);
