import 'dart:io';
import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../services/movie.dart';
import '../widgets/movie_element.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
              Column(children: [
                const Text('MOVIES DETAIL APP'),
                const Text(
                    'Place the name of the movie you want to know its details here'),
                TextField(
                  controller: searchController,
                ),
              ]),
              Container(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: const Text('Search History')),
              Flexible(
                  child: ListView.builder(
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
                                Navigator.pushNamed(context, '/movie',
                                    arguments: movie);
                                _addInSearchHistory(movie);
                              },
                            ));
                      })),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      searchMovie(searchController.text).then((movie) {
                        Navigator.pushNamed(context, '/movie',
                            arguments: movie);
                        _addInSearchHistory(movie);
                      }).onError((error, stackTrace) {
                        if (error is FormatException) {
                          Fluttertoast.showToast(
                              msg: error.message,
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.TOP,
                              backgroundColor: Colors.amber,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        }
                        if (error is HttpException) {
                          Fluttertoast.showToast(
                              msg: error.toString(),
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.TOP,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        }
                      });
                    },
                    child: const Text('Search movie'),
                  ))
            ])));
  }
}
