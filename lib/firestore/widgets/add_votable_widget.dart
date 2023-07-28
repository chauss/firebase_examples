import 'package:firebase_examples/firestore/constants/firestore_strings.dart';
import 'package:firebase_examples/firestore/models/votable_payload.dart';
import 'package:firebase_examples/firestore/providers/votable_update/votable_update_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@immutable
class AddVotableWidget extends ConsumerWidget {
  final TextEditingController controller = TextEditingController();

  AddVotableWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final votableUpdateNotifier = ref.read(votableUpdateProvider.notifier);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 60,
          width: 200,
          child: TextField(
            controller: controller,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: FirestoreStrings.addNewVotableTextFieldPlaceholder,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            if (controller.text.isNotEmpty) {
              votableUpdateNotifier.addVotable(
                VotablePayload(name: controller.text, votes: 0),
              );
              controller.text = "";
            }
          },
          child: const Text(FirestoreStrings.addNewVotableButtonText),
        ),
      ],
    );
  }
}
