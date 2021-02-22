import 'package:flutter/material.dart';

import 'marvel_heroes/app/pages/character_details/character_details_page.dart';
import 'marvel_heroes/app/pages/home/marvel_home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marvel Heroes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MarvelHeroesHome(),
      routes: {
        '/character': (BuildContext context) => CharacterDetailsPage(),
      },
    );
  }
}
