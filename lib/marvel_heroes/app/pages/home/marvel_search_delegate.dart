import 'package:flutter/material.dart';
import 'package:marvel_heroes/marvel_heroes/domain/entities/character.dart';

class MarvelSearchDelegate extends SearchDelegate<String> {
  MarvelSearchDelegate({this.list = const <Character>[]});
  final List<Character> list;
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () => query = '',
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final querySuggestions = query.isEmpty
        ? <Character>[]
        : List<Character>.from(list.where((element) => element.name.toLowerCase().startsWith(
              query.trim().toLowerCase(),
            )));
    return ListView.builder(
      itemCount: querySuggestions.length,
      itemBuilder: (context, index) => ListTile(
        onTap: () => Navigator.of(context).popAndPushNamed('/character', arguments: querySuggestions[index]),
        title: RichText(
          text: TextSpan(
              text: querySuggestions[index].name.substring(
                  0,
                  querySuggestions[index].name.length < query.length
                      ? querySuggestions[index].name.length
                      : query.length),
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(
                  text: querySuggestions[index].name.substring(querySuggestions[index].name.length < query.length
                      ? querySuggestions[index].name.length
                      : query.length),
                  style: TextStyle(color: Colors.grey),
                ),
              ]),
        ),
      ),
    );
  }
}
