import 'package:flutter/material.dart';

import '../../core/styles.dart';
import '../../domain/entities/character.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard(this.character, {this.size = const Size(140, 230)});
  final Character character;
  final Size size;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed('/character', arguments: character),
      child: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Hero(
              tag: '${character.realName}/image',
              child: Container(
                width: size.width,
                height: size.height,
                decoration: BoxDecoration(
                  boxShadow: character.styles?.shadow != null ? [character.styles?.shadow] : null,
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    image: AssetImage(character.imageURL),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Container(
              width: size.width,
              height: size.height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.black.withOpacity(.3), Colors.black.withOpacity(.75)],
                ),
              ),
            ),
            Container(
              width: size.width,
              height: size.height,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Hero(
                  tag: '${character.realName}/text',
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Material(
                        color: Colors.transparent,
                        child: Text(
                          character.realName,
                          style: textStyleMedium10,
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: Text(
                          character.name,
                          style: textStyleHeavy20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
