import 'package:firebase_examples/authentication/constants/authentication_strings.dart';
import 'package:firebase_examples/widgets/custom_button.dart';
import 'package:flutter/material.dart';

typedef OnActionCallback = void Function(String email, String password);

class EmailPasswordActionWidget extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final OnActionCallback onAction;
  final String actionTitle;

  EmailPasswordActionWidget({
    super.key,
    required this.onAction,
    required this.actionTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          actionTitle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 20),
        TextField(
          controller: emailController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: AuthenticationStrings.emailTextFieldPlaceholder,
          ),
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 20),
        TextField(
          controller: passwordController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: AuthenticationStrings.passwordTextFieldPlaceholder,
          ),
          keyboardType: TextInputType.visiblePassword,
          obscureText: true,
        ),
        const SizedBox(height: 40),
        CustomButton(
          onPressed: () =>
              onAction(emailController.text, passwordController.text),
          title: actionTitle,
        ),
      ],
    );
  }
}
