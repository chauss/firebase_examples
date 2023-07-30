import 'package:flutter/material.dart';

class HorizontalSeparator extends StatelessWidget {
  final String name;

  const HorizontalSeparator({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            height: 1,
            color: Colors.white.withOpacity(0.5),
          ),
        ),
        const SizedBox(width: 20),
        Text(name),
        const SizedBox(width: 20),
        Expanded(
          child: Container(
            height: 1,
            color: Colors.white.withOpacity(0.5),
          ),
        )
      ],
    );
  }
}
