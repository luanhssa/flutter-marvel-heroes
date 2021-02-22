import 'package:flutter/material.dart';

import '../character_type.dart';

class CharCategory {
  const CharCategory({@required this.gradient, @required this.icon, @required this.type});
  final Gradient gradient;
  final Widget icon;
  final CharacterType type;
}
