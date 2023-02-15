import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../widgets/poster_image.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;

    return Scaffold(
        appBar: AppBar(),
        body: Padding(
            padding: const EdgeInsets.all(30),
            // Movie details data
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('${movie.title} (${movie.year})'),
                  const SizedBox(height: 20),
                  PosterImage(poster: movie.poster, width: 220, height: 340),
                  const SizedBox(height: 20),
                  Flexible(child: Text(movie.plot))
                ])));
  }
}
