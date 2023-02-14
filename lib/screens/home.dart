import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            alignment: Alignment.center,
            child: FractionallySizedBox(
                widthFactor: 0.7,
                heightFactor: 0.7,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [HomeButton()],
                ))));
  }
}

class HomeButton extends StatelessWidget {
  const HomeButton({super.key});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/movies');
        },
        child: const Text('Movies'));
  }
}
