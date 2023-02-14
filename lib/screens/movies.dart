import 'package:flutter/material.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  // TODO: Search History list variable

  @override
  State<MoviesScreen> createState() => _MoviesScreen();
}

class _MoviesScreen extends State<MoviesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.fromLTRB(15, 50, 10, 15),
            child: Column(children: [
              Expanded(
                  flex: 2,
                  child: Column(children: const [
                    Text('MOVIES DETAIL APP'),
                    Text(
                        'Place the name of the movie you want to know its details here'),
                    TextField(),
                  ])),
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
                                  print('searching...');
                                },
                                child: const Text('Search movie'),
                              )))))
            ])));
  }
}
