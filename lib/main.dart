import 'package:flutter/material.dart';
import 'screens/search_movies.dart';
import 'screens/movie_details.dart';

void main() {
  runApp(const MoviesApp());
}

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/search': (context) => const SearchMoviesScreen(),
        '/movie': (context) => const MovieDetailsScreen()
      },
      initialRoute: '/search',
    );
  }
}
