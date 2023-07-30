import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_examples/authentication/authentication_page.dart';
import 'package:firebase_examples/authentication/constants/authentication_strings.dart';
import 'package:firebase_examples/constants/main_strings.dart';
import 'package:firebase_examples/firebase_options.dart';
import 'package:firebase_examples/firestore/firestore_page.dart';
import 'package:firebase_examples/firestore/constants/firestore_strings.dart';
import 'package:firebase_examples/widgets/custom_button.dart';
import 'package:firebase_examples/widgets/web_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  configureLogging();

  runApp(
    const ProviderScope(
      child: WebContainerWidget(
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase examples',
      theme: ThemeData.dark().copyWith(
        colorScheme: const ColorScheme.dark(primary: Colors.orange),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(MainStrings.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/icons/firebase_examples_round.png',
                  width: 140,
                ),
                const SizedBox(width: 20),
                Text(
                  MainStrings.examples,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
            const SizedBox(height: 60),
            CustomButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AuthenticationPage()),
              ),
              title: AuthenticationStrings.title,
            ),
            const SizedBox(height: 20),
            CustomButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FirestorePage()),
              ),
              title: FirestoreStrings.title,
            ),
          ],
        ),
      ),
    );
  }
}

void configureLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((event) {
    // ignore: avoid_print
    print(
        '[${event.level.name}] ${event.loggerName} ${event.time}: ${event.message}');
  });
}
