import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../services/movie.dart';

class SearchMoviesScreen extends StatefulWidget {
  const SearchMoviesScreen({super.key});

  @override
  State<SearchMoviesScreen> createState() => _SearchMoviesScreen();
}

class _SearchMoviesScreen extends State<SearchMoviesScreen> {
  List<Movie> searchHistory = [];
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.fromLTRB(15, 50, 10, 15),
            child: Column(children: [
              Expanded(
                  flex: 2,
                  child: Column(children: [
                    const Text('MOVIES DETAIL APP'),
                    const Text(
                        'Place the name of the movie you want to know its details here'),
                    TextField(
                      controller: searchController,
                    ),
                  ])),
              // TODO: List cache movies
              Expanded(flex: 4, child: Container()),
              Expanded(
                  flex: 1,
                  child: Container(
                      alignment: Alignment.center,
                      child: Expanded(
                          child: SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  searchMovie(searchController.text)
                                      .then((result) {
                                    Navigator.pushNamed(context, '/movie',
                                        arguments: result);
                                  });
                                },
                                child: const Text('Search movie'),
                              )))))
            ])));
  }
}