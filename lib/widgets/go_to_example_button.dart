import 'package:flutter/material.dart';

class GoToExampleButton extends StatelessWidget {
  final Widget examplePage;
  final String title;

  const GoToExampleButton({
    super.key,
    required this.examplePage,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => examplePage),
      ),
      child: SizedBox(
        height: 50,
        child: Center(
          child: Text(
            title,
            style: const TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
