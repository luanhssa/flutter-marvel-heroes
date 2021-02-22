import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum CharacterType {
  hero,
  villain,
  antiHero,
  alien,
  human,
}

extension CharacterTypeExtension on CharacterType {
  String get name {
    switch (this) {
      case CharacterType.hero:
        return 'Heróis';
      case CharacterType.villain:
        return 'Vilões';
      case CharacterType.antiHero:
        return 'Anti-Heróis';
      case CharacterType.alien:
        return 'Aliegnígenas';
      case CharacterType.human:
        return 'Humanos';
    }
    return '';
  }

  Widget get icon {
    switch (this) {
      case CharacterType.hero:
        return SvgPicture.asset('assets/icons/Hero.svg', color: Colors.white);
      case CharacterType.villain:
        return SvgPicture.asset('assets/icons/Villain.svg', color: Colors.white);
      case CharacterType.antiHero:
        return SvgPicture.asset('assets/icons/Antihero.svg', color: Colors.white);
      case CharacterType.alien:
        return SvgPicture.asset('assets/icons/Alien.svg', color: Colors.white);
      case CharacterType.human:
        return SvgPicture.asset('assets/icons/Human.svg', color: Colors.white);
    }
    return Container();
  }

  List<Color> get colors {
    switch (this) {
      case CharacterType.hero:
        return [Color(0xFF005BEA), Color(0xFF00C6FB)];
      case CharacterType.villain:
        return [Color(0xFFED1D24), Color(0xFFED1F69)];
      case CharacterType.antiHero:
        return [Color(0xFFB224EF), Color(0xFF7579FF)];
      case CharacterType.alien:
        return [Color(0xFF0BA360), Color(0xFF3CBA92)];
      case CharacterType.human:
        return [Color(0xFFFF7EB3), Color(0xFFFF758C)];
    }
    return [];
  }
}
