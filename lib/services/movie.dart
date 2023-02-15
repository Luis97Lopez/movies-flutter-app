import 'dart:convert';
import '../models/movie.dart';
import 'package:http/http.dart' as http;

Future<Movie> searchMovie(text) async {
  Movie movie;

  var key = 'bb7a7990';
  var url = 'http://www.omdbapi.com/?apikey=$key&t=$text';

  try {
    return http.get(Uri.parse(url)).then((response) async {
      final movieJson = json.decode(response.body);
      print(movieJson);
      if (movieJson["Response"] == "True") {
        movie = Movie.fromJson(movieJson);
        return movie;
      }

      return Movie.getEmpty();
    });
  } catch (e) {
    print('Error api: ' + e.toString() + '.');
    return Future.value(Movie.getEmpty());
  }
}
