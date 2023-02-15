import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../widgets/list_element.dart';

class MoviesList extends StatelessWidget {
  final Map<String, Movie> searchHistory;
  final Function addMovieInSearchHistory;

  const MoviesList(
      {super.key,
      required this.searchHistory,
      required this.addMovieInSearchHistory});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: searchHistory.length,
        itemBuilder: (context, index) {
          int realIndex = searchHistory.length - index - 1;
          String key = searchHistory.keys.elementAt(realIndex);
          Movie movie = searchHistory[key]!;
          return Container(
              alignment: Alignment.center,
              child: MovieElement(
                movie: movie,
                callback: () {
                  Navigator.pushNamed(context, '/movie', arguments: movie);
                  addMovieInSearchHistory(movie);
                },
              ));
        });
  }
}
