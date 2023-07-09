import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ErrorScreen extends StatefulWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  State<ErrorScreen> createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text("Error Page, go Back to the Home Page"),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () => context.go("/mainPanelScreen"),
                child: const Text("Go Back"))
          ],
        ),
      ),
    );
  }
}
