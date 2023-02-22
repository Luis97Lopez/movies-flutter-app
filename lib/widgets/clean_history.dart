import 'package:flutter/material.dart';

class CleanHistoryButton extends StatelessWidget {
  final Function function;
  const CleanHistoryButton({super.key, required this.function});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: ElevatedButton(
            onPressed: () {
              function();
            },
            child: const Text('Clean')));
  }
}
