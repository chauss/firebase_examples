import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_examples/authentication/constants/authentication_strings.dart';
import 'package:firebase_examples/authentication/providers/user_notifier.dart';
import 'package:firebase_examples/authentication/providers/user_provider.dart';
import 'package:firebase_examples/authentication/widgets/email_password_action_widget.dart';
import 'package:firebase_examples/authentication/widgets/horizontal_separator.dart';
import 'package:firebase_examples/authentication/widgets/user_widget.dart';
import 'package:firebase_examples/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthenticationPage extends ConsumerStatefulWidget {
  const AuthenticationPage({super.key});

  @override
  ConsumerState<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends ConsumerState<AuthenticationPage> {
  var showLoginPage = true;

  @override
  Widget build(BuildContext context) {
    User? user = ref.watch(userProvider);
    UserNotifier userNotifier = ref.read(userProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text(AuthenticationStrings.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: user == null
            ? _buildRegistrationOrLogin(userNotifier)
            : UserWidget(user: user),
      ),
    );
  }

  Widget _buildRegistrationOrLogin(UserNotifier userNotifier) {
    if (showLoginPage) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          EmailPasswordActionWidget(
            actionTitle: AuthenticationStrings.login,
            onAction: (email, password) async {
              var success = await userNotifier.login(email, password);
              if (!context.mounted) return;
              if (success) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: const Text(AuthenticationStrings.loginSuccessfull),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                ));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: const Text(AuthenticationStrings.loginFailed),
                  backgroundColor: Theme.of(context).colorScheme.error,
                ));
              }
            },
          ),
          const SizedBox(height: 20),
          const HorizontalSeparator(
            name: AuthenticationStrings.loginRegistrationSeparator,
          ),
          const SizedBox(height: 20),
          CustomButton(
            onPressed: () => setState(() => showLoginPage = false),
            title: AuthenticationStrings.switchToRegistration,
          )
        ],
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          EmailPasswordActionWidget(
            actionTitle: AuthenticationStrings.register,
            onAction: (email, password) async {
              var success = await userNotifier.register(email, password);
              if (!context.mounted) return;
              if (success) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content:
                      const Text(AuthenticationStrings.registrationSuccessfull),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                ));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: const Text(AuthenticationStrings.registrationFailed),
                  backgroundColor: Theme.of(context).colorScheme.error,
                ));
              }
            },
          ),
          const SizedBox(height: 20),
          const HorizontalSeparator(
            name: AuthenticationStrings.loginRegistrationSeparator,
          ),
          const SizedBox(height: 20),
          CustomButton(
            onPressed: () => setState(() => showLoginPage = true),
            title: AuthenticationStrings.switchToLogin,
          )
        ],
      );
    }
  }
}
