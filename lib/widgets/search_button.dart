import 'package:flutter/material.dart';
import 'dart:io';
import '../services/movie.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SearchButton extends StatelessWidget {
  final Function addMovieInSearchHistory;
  final TextEditingController searchController;
  const SearchButton(
      {super.key,
      required this.addMovieInSearchHistory,
      required this.searchController});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            searchMovie(searchController.text).then((movie) {
              Navigator.pushNamed(context, '/movie', arguments: movie);
              addMovieInSearchHistory(movie);
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
        ));
  }
}
