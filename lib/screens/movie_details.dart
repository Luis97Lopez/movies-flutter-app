import 'package:flutter/material.dart';
import '../models/movie.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;

    return Scaffold(
        appBar: AppBar(),
        body: Container(
            child: movie.isEmpty
                ? const Center(
                    child: Text('No movie found.'),
                  )
                : Text(movie.title)));
  }
}
