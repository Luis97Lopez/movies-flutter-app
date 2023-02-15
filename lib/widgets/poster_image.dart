import 'package:flutter/material.dart';

class PosterImage extends StatelessWidget {
  final String poster;
  final double width;
  final double height;
  const PosterImage(
      {super.key, required this.poster, this.width = 55, this.height = 85});

  @override
  Widget build(BuildContext context) {
    return poster != "N/A"
        ? Image.network(poster, width: width, height: height)
        : Image.asset('assets/images/not_available.png',
            width: width, height: height);
  }
}
