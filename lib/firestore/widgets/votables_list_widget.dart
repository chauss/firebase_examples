import 'package:firebase_examples/firestore/constants/firestore_strings.dart';
import 'package:firebase_examples/firestore/providers/votables_provider.dart';
import 'package:firebase_examples/firestore/widgets/votable_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VotablesListWidget extends ConsumerWidget {
  const VotablesListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final votables = ref.watch(votablesProvider);

    return RefreshIndicator(
      onRefresh: () {
        final _ = ref.refresh(votablesProvider);
        return Future.delayed(const Duration(seconds: 1));
      },
      child: votables.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) =>
            const Text(FirestoreStrings.errorOnLoadingVotables),
        data: (data) {
          if (data.isEmpty) {
            return const Center(child: Text(FirestoreStrings.noVotablesYet));
          }
          return ListView.builder(
            shrinkWrap: true,
            itemCount: data.length,
            itemBuilder: (context, index) => ListTile(
              title: VotableWidget(
                votable: data.elementAt(index),
              ),
            ),
          );
        },
      ),
    );
  }
}
