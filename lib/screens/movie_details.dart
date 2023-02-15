import 'package:flutter/material.dart';
import '../models/movie.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;

    return Scaffold(
        appBar: AppBar(),
        body: Column(children: [
          movie.isEmpty
              ? const Center(
                  child: Text('No movie found.'),
                )
              : Text(movie.title),
          Expanded(
              flex: 4,
              child: Container(
                  height: 200,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  child: movie.poster != "N/A"
                      ? Image.network(movie.poster)
                      : Image.network(
                          'https://pr1.nicelocal.com.mx/6Tmq3_gfIF5my44xYQkj4w/1120x700,q85/4px-BW84_n0QJGVPszge3NRBsKw-2VcOifrJIjPYFYkOtaCZxxXQ2etrE1hiF4WW3s1dhN3Z3rAlyi4VEx3DBlV_KMA_wnwPjMffTHw9fI0FmnQv3ADBCQ')))
        ]));
  }
}
