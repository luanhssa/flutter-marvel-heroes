import 'package:flutter/material.dart';
import 'package:marvel_heroes/marvel_heroes/core/styles.dart';

class MarvelHomeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, kToolbarHeight, 12, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  'Sejam bem-vindos ao Marvel Heroes! Este é o segundo projeto da umpontoseis criado de designers '
                  'para desenvolvedores, que traz com ele o intuito de aperfeiçoar nossas habilidades e estreitar '
                  'os laços profissionais.',
                  style: textStyleMedium14.copyWith(color: Colors.black87)),
              Center(
                child: Text(
                  'desing by @umpontoseis',
                  style: textStyleBold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
