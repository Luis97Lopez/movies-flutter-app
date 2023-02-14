import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'screens/movies.dart';

void main() {
  runApp(const MoviesApp());
}

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/home': (context) => const HomeScreen(),
        '/movies': (context) => const MoviesScreen()
      },
      initialRoute: '/home',
    );
  }
}
