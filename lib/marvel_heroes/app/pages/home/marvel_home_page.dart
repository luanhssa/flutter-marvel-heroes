import 'package:bloc_generic_streams/bloc_generic_streams.dart';
import 'package:flutter/material.dart';

import 'marvel_home_bloc.dart';
import 'marvel_home_view.dart';

class MarvelHeroesHome extends StatefulWidget {
  @override
  _MarvelHeroesHomeState createState() => _MarvelHeroesHomeState();
}

class _MarvelHeroesHomeState extends State<MarvelHeroesHome> {
  MarvelHomeBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = MarvelHomeBloc();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MarvelHomeBloc>(
      blocBuilder: () => bloc,
      child: MarvelHomeView(),
    );
  }
}
