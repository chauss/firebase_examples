import 'package:firebase_examples/firestore/models/votable.dart';
import 'package:firebase_examples/firestore/providers/votable_update/votable_update_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@immutable
class VotableWidget extends ConsumerWidget {
  final Votable votable;

  const VotableWidget({
    super.key,
    required this.votable,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final votableUpdateNotifier = ref.read(votableUpdateProvider.notifier);

    return Row(
      children: [
        const SizedBox(width: 20),
        Text(votable.name),
        Expanded(child: Container()),
        Text(votable.votes.toString()),
        const SizedBox(width: 60),
        TextButton(
            onPressed: () => votableUpdateNotifier.decreaseVotes(votable),
            child: const Text("-")),
        Container(
          width: 0.5,
          height: 30,
          color: Colors.white.withOpacity(0.6),
        ),
        TextButton(
            onPressed: () => votableUpdateNotifier.increaseVotes(votable),
            child: const Text("+")),
        const SizedBox(width: 20),
      ],
    );
  }
}
