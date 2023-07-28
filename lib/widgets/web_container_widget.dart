import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WebContainerWidget extends ConsumerWidget {
  final Widget child;

  const WebContainerWidget({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (kIsWeb) {
      return Container(
        color: ThemeData.dark().scaffoldBackgroundColor.withOpacity(0.8),
        child: Center(
          child: ClipRect(
            clipBehavior: Clip.hardEdge,
            child: SizedBox(
              width: 600,
              child: Material(elevation: 16, child: child),
            ),
          ),
        ),
      );
    }
    return child;
  }
}
