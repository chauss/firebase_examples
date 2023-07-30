import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_examples/authentication/constants/authentication_strings.dart';
import 'package:firebase_examples/authentication/providers/user_notifier.dart';
import 'package:firebase_examples/authentication/providers/user_provider.dart';
import 'package:firebase_examples/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserWidget extends ConsumerWidget {
  final User user;

  const UserWidget({super.key, required this.user});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    UserNotifier userNotifier = ref.read(userProvider.notifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            AuthenticationStrings.userLoggedInHeadline,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        if (!user.emailVerified) ...[
          const SizedBox(height: 40),
          CustomButton(
              onPressed: userNotifier.sendConfirmEmail,
              title: AuthenticationStrings.sendVerificationEmail),
        ],
        const SizedBox(height: 40),
        Text(
          AuthenticationStrings.yourUserId,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 8),
        SelectableText(user.uid),
        const SizedBox(height: 80),
        Center(
          child: TextButton(
            onPressed: userNotifier.logout,
            child: Text(
              AuthenticationStrings.logout,
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
          ),
        )
      ],
    );
  }
}
