import 'package:flutter/material.dart';
import '../models/movie.dart';
import 'poster_image.dart';

class MovieElement extends StatelessWidget {
  final Movie movie;
  final Function() callback;
  const MovieElement({super.key, required this.movie, required this.callback});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: callback,
        child: SizedBox(
            height: 100,
            child: Container(
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 2, color: Theme.of(context).primaryColor)),
                child: Row(children: [
                  PosterImage(poster: movie.poster),
                  Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('${movie.title} (${movie.year})'),
                            const Text('See details →')
                          ]))
                ]))));
  }
}
