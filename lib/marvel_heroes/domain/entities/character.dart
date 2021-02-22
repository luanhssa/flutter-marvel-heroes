import 'package:flutter/material.dart';
import 'package:marvel_heroes/marvel_heroes/app/character_type.dart';

class Character {
  Character({
    @required this.type,
    @required this.name,
    @required this.realName,
    @required this.imageURL,
    this.details = '',
    @required this.stats,
    @required this.habilities,
    this.styles,
  });
  final String name;
  final String realName;
  final String imageURL;
  final CharacterStats stats;
  final String details;
  final CharacterType type;

  final CharacterHabilities habilities;

  final CharacterStyles styles;
}

class CharacterStats {
  CharacterStats({
    this.age,
    this.weight,
    this.height,
    this.planet,
  });
  final int age;
  final double weight;
  final double height;
  final String planet;
}

class CharacterHabilities {
  CharacterHabilities({
    this.strength,
    this.intelligence,
    this.agility,
    this.resistance,
    this.speed,
  });
  final int strength;
  final int intelligence;
  final int agility;
  final int resistance;
  final int speed;
}

class CharacterStyles {
  const CharacterStyles({this.shadow});
  final BoxShadow shadow;
}
