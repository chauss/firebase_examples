import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';

class UserNotifier extends StateNotifier<User?> {
  static final log = Logger('UserNotifier');

  late StreamSubscription<User?> userChangeSubscription;

  UserNotifier() : super(null) {
    userChangeSubscription =
        FirebaseAuth.instance.authStateChanges().listen((firebaseUser) async {
      state = firebaseUser;
    });
  }

  Future<bool> register(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      log.warning("Failed to register: $e");
      return false;
    }
  }

  Future<bool> login(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      log.warning("Failed to login: $e");
      return false;
    }
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<void> sendConfirmEmail() async {
    await FirebaseAuth.instance.currentUser?.sendEmailVerification();
  }

  @override
  void dispose() {
    super.dispose();
    userChangeSubscription.cancel();
  }
}
