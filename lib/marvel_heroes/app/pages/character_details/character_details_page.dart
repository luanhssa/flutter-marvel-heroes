import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marvel_heroes/marvel_heroes/core/styles.dart';
import 'package:marvel_heroes/marvel_heroes/domain/entities/character.dart';

class CharacterDetailsPage extends StatefulWidget {
  @override
  _CharacterDetailsPageState createState() => _CharacterDetailsPageState();
}

class _CharacterDetailsPageState extends State<CharacterDetailsPage> {
  Character character;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final args = ModalRoute.of(context).settings.arguments;
    if (args != null && args is Character) {
      setState(() => character = args);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Hero(
                  tag: character.realName,
                  child: Container(
                    width: size.width,
                    height: size.height,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                        image: AssetImage(character.imageURL), //NetworkImage(character.imageURL),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: size.width,
                  height: size.height,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.black12, Colors.black87],
                    ),
                  ),
                ),
                Positioned(
                  top: kToolbarHeight,
                  left: 0,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back),
                    color: Colors.white,
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
                Positioned(
                  bottom: kToolbarHeight,
                  left: 24,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 240,
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
                                  style: textStyleMedium16,
                                ),
                              ),
                              Material(
                                color: Colors.transparent,
                                child: Text(
                                  character.name,
                                  style: textStyleHeavy40,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 48),
                      Container(
                        width: size.width - 48,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset('assets/icons/Vector.svg', color: Colors.white),
                                SizedBox(height: 12),
                                Text('${character.stats.age} anos', style: textStyleMedium12),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset('assets/icons/Vector-1.svg', color: Colors.white),
                                SizedBox(height: 12),
                                Text(
                                  '${character.stats.weight.toStringAsFixed(1)}kg',
                                  style: textStyleMedium12,
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset('assets/icons/Vector-2.svg', color: Colors.white),
                                SizedBox(height: 12),
                                Text(
                                  '${character.stats.height.toStringAsFixed(2)}m',
                                  style: textStyleMedium12,
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset('assets/icons/Vector-3.svg', color: Colors.white),
                                SizedBox(height: 12),
                                Text(character.stats.planet, style: textStyleMedium12),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 24),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(character.details, style: textStyleMedium14),
                  SizedBox(height: 32),
                  Text('Habilidades', style: textStyleBold.copyWith(color: Colors.white)),
                  SizedBox(height: 24),
                  Container(
                    width: size.width - 48,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Força', style: textStyleRegular12),
                            BarValues(character.habilities.strength),
                          ],
                        ),
                        SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Inteligência', style: textStyleRegular12),
                            BarValues(character.habilities.strength),
                          ],
                        ),
                        SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Agilidade', style: textStyleRegular12),
                            BarValues(character.habilities.agility),
                          ],
                        ),
                        SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Resistência', style: textStyleRegular12),
                            BarValues(character.habilities.resistance),
                          ],
                        ),
                        SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Velocidade', style: textStyleRegular12),
                            BarValues(character.habilities.speed),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 100),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BarValues extends StatelessWidget {
  BarValues(this.value);
  final int value;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.65,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List<Widget>.generate(100, (index) {
          return Container(
            width: 1,
            height: value == index ? 12 : 8,
            color: index <= value ? Colors.white : Colors.grey,
          );
        }),
      ),
    );
  }
}
