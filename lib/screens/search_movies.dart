import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../widgets/list.dart';
import '../widgets/search_button.dart';

class SearchMoviesScreen extends StatefulWidget {
  const SearchMoviesScreen({super.key});

  @override
  State<SearchMoviesScreen> createState() => _SearchMoviesScreen();
}

class _SearchMoviesScreen extends State<SearchMoviesScreen> {
  Map<String, Movie> searchHistory = {};
  TextEditingController searchController = TextEditingController();

  void _addInSearchHistory(movie) {
    setState(() {
      searchHistory.remove(movie.title);
      searchHistory[movie.title] = movie;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.fromLTRB(15, 50, 10, 15),
            child: Column(children: [
              // Title
              const Text('MOVIES DETAIL APP'),
              const Text(
                  'Place the name of the movie you want to know its details here'),
              // Text Input
              TextField(
                controller: searchController,
              ),
              // Subtitle
              Container(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: const Text('Search History')),
              // Movies list
              Flexible(
                  child: MoviesList(
                searchHistory: searchHistory,
                addMovieInSearchHistory: _addInSearchHistory,
              )),
              // Search Button
              SearchButton(
                  addMovieInSearchHistory: _addInSearchHistory,
                  searchController: searchController)
            ])));
  }
}
