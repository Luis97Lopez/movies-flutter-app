import 'dart:convert';
import 'dart:io';
import '../models/movie.dart';
import 'package:http/http.dart' as http;

Future<Movie> searchMovie(text) async {
  var key = 'bb7a7990';
  var url = 'http://www.omdbapi.com/?apikey=$key&t=$text';

  if (text == '') {
    throw const FormatException('Add a movie title');
  }
  try {
    return http.get(Uri.parse(url)).then((response) async {
      final movieJson = json.decode(response.body);
      if (movieJson["Response"] == "False") {
        throw FormatException(movieJson["Error"]);
      }
      return Movie.fromJson(movieJson);
    });
  } catch (e) {
    throw HttpException(
      'Server Error. Try again later. $e',
    );
  }
}
