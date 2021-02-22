import 'package:bloc_generic_streams/bloc_generic_streams.dart';
import 'package:flutter/painting.dart';
import 'package:marvel_heroes/marvel_heroes/domain/entities/character.dart';

import '../../character_type.dart';

class MarvelHomeBloc extends BlocBase {
  MarvelHomeBloc() {
    _init();
  }

  final GenericBehavior<CharacterType> filter = GenericBehavior<CharacterType>();
  final GenericBehavior<List<Character>> characters = GenericBehavior<List<Character>>();

  Future<void> _init() async {
    await Future<void>.delayed(const Duration(milliseconds: 800));
    characters.sink.add([
      Character(
        type: CharacterType.hero,
        name: 'Homem Aranha',
        realName: 'Peter Parker',
        imageURL: 'assets/characters/spider_man.png',
        details: 'Lorem Ipsum',
        stats: CharacterStats(age: 30, weight: 78, height: 1.80, planet: 'Terra 616'),
        habilities: CharacterHabilities(strength: 75, intelligence: 70, agility: 90, resistance: 60, speed: 80),
        styles: CharacterStyles(
            shadow: BoxShadow(
          color: Color(0xFFB90808).withOpacity(.12),
          offset: const Offset(0, 20),
          blurRadius: 20,
        )),
      ),
      Character(
        type: CharacterType.hero,
        name: 'Pantera Negra',
        realName: 'TChalla',
        imageURL: 'assets/characters/black_panther.png',
        details: 'Lorem Ipsum',
        stats: CharacterStats(age: 47, weight: 91, height: 1.83, planet: 'Terra 616'),
        habilities: CharacterHabilities(strength: 75, intelligence: 55, agility: 99, resistance: 55, speed: 80),
        styles: CharacterStyles(
            shadow: BoxShadow(
          color: Color(0xFF6341C7).withOpacity(.12),
          offset: const Offset(0, 20),
          blurRadius: 20,
        )),
      ),
      Character(
        type: CharacterType.hero,
        name: 'Homem de Ferro',
        realName: 'Tony Stark',
        imageURL: 'assets/characters/iron_man.png',
        details: 'Lorem Ipsum',
        stats: CharacterStats(age: 50, weight: 102, height: 1.85, planet: 'Terra 616'),
        habilities: CharacterHabilities(strength: 87, intelligence: 95, agility: 75, resistance: 40, speed: 90),
        styles: CharacterStyles(
            shadow: BoxShadow(
          color: Color(0xFFD69E0D).withOpacity(.12),
          offset: const Offset(0, 20),
          blurRadius: 20,
        )),
      ),
      Character(
        type: CharacterType.villain,
        name: 'Caveira Vermelha',
        realName: 'Jöhan Schmidt',
        imageURL: 'assets/characters/red_skull.png',
        details: 'Lorem Ipsum',
        stats: CharacterStats(age: 50, weight: 102, height: 1.85, planet: 'Terra 616'),
        habilities: CharacterHabilities(strength: 87, intelligence: 95, agility: 75, resistance: 40, speed: 90),
        styles: CharacterStyles(
            shadow: BoxShadow(
          color: Color(0xFF2A6346).withOpacity(.12),
          offset: const Offset(0, 20),
          blurRadius: 20,
        )),
      ),
      Character(
        type: CharacterType.antiHero,
        name: 'Deadpool',
        realName: 'Wade Wilson',
        imageURL: 'assets/characters/deadpool.png',
        details: 'Lorem Ipsum',
        stats: CharacterStats(age: 50, weight: 102, height: 1.85, planet: 'Terra 616'),
        habilities: CharacterHabilities(strength: 87, intelligence: 95, agility: 75, resistance: 40, speed: 90),
        styles: CharacterStyles(
            shadow: BoxShadow(
          color: Color(0xFFC4484B).withOpacity(.12),
          offset: const Offset(0, 20),
          blurRadius: 20,
        )),
      ),
      Character(
        type: CharacterType.alien,
        name: 'Thanos',
        realName: 'Deviant',
        imageURL: 'assets/characters/thanos.png',
        details: 'Lorem Ipsum',
        stats: CharacterStats(age: 50, weight: 102, height: 1.85, planet: 'Terra 616'),
        habilities: CharacterHabilities(strength: 87, intelligence: 95, agility: 75, resistance: 40, speed: 90),
        styles: CharacterStyles(
            shadow: BoxShadow(
          color: Color(0xFFC4484B).withOpacity(.12),
          offset: const Offset(0, 20),
          blurRadius: 20,
        )),
      ),
      Character(
        type: CharacterType.human,
        name: 'Howard Stark',
        realName: '',
        imageURL: 'assets/characters/howard_stark.png',
        details: 'Lorem Ipsum',
        stats: CharacterStats(age: 50, weight: 102, height: 1.85, planet: 'Terra 616'),
        habilities: CharacterHabilities(strength: 87, intelligence: 95, agility: 75, resistance: 40, speed: 90),
        styles: CharacterStyles(
            shadow: BoxShadow(
          color: Color(0xFFCF7323).withOpacity(.12),
          offset: const Offset(0, 20),
          blurRadius: 20,
        )),
      ),
    ]);
  }

  @override
  void dispose() {
    characters?.dispose();
  }
}
