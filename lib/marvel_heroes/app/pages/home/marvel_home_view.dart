import 'package:bloc_generic_streams/bloc_generic_streams.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marvel_heroes/marvel_heroes/app/widgets/section_header_widget.dart';
import 'package:marvel_heroes/marvel_heroes/domain/entities/character.dart';

import '../../../core/styles.dart';
import '../../character_type.dart';
import '../../widgets/character_card.dart';
import '../../widgets/character_category.dart';
import '../../widgets/character_row.dart';
import 'marvel_home_bloc.dart';
import 'marvel_home_drawer.dart';
import 'marvel_search_delegate.dart';

const double cardRowHeight = 270;

class MarvelHomeView extends StatelessWidget {
  MarvelHomeView();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<MarvelHomeBloc>(context);
    return Scaffold(
      key: _scaffoldKey,
      drawer: MarvelHomeDrawer(),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: Theme.of(context).iconTheme.copyWith(
              color: colorDark,
            ),
        title: Container(
          width: 71,
          child: ShaderMask(
            shaderCallback: (bounds) => LinearGradient(
              colors: [Color(0xFFED1D24), Color(0xFFED1F69)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0, 1],
            ).createShader(bounds),
            blendMode: BlendMode.srcATop,
            child: Image.asset('assets/Marvel Logo.png', fit: BoxFit.contain),
          ),
        ),
        leading: IconButton(
          icon: SvgPicture.asset('assets/icons/Menu.svg'),
          onPressed: () => _scaffoldKey.currentState.openDrawer(),
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset('assets/icons/Search.svg'),
            onPressed: () => showSearch(context: context, delegate: MarvelSearchDelegate(list: bloc.characters.value)),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('Bem vindo ao Marvel Heroes', style: textStyleSemiBold),
                Text('Escolha o seu personagem', style: textStyleHeavy32),
              ]),
            ),
            SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: CategoriesRow(
                categories: List<CharCategory>.from(CharacterType.values.map(
                  (type) => CharCategory(
                    type: type,
                    icon: type.icon,
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: type.colors,
                    ),
                  ),
                )),
              ),
            ),
            SizedBox(height: 44),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StreamBuilder<List<Character>>(
                  stream: bloc.characters.stream,
                  builder: (context, snapshot) {
                    final characters = snapshot.data ?? [];
                    if (characters.isEmpty) {
                      return Center(child: CircularProgressIndicator());
                    }
                    return StreamBuilder<CharacterType>(
                      stream: bloc.filter.stream,
                      builder: (context, snapshot) {
                        final filtered = snapshot.data;
                        final selected = filtered != null;
                        List<Character> list = [];
                        if (selected) {
                          list = List<Character>.from(
                            characters.where((c) => c.type == filtered),
                          );
                        }
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 400),
                          child: selected
                              ? Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 24),
                                  child: Wrap(
                                    spacing: 16,
                                    runSpacing: 24,
                                    children: List<Widget>.from(list.map(
                                      (char) => CharacterCard(char),
                                    )),
                                  ),
                                )
                              : ListView.separated(
                                  shrinkWrap: true,
                                  physics: const ClampingScrollPhysics(),
                                  itemCount: CharacterType.values.length,
                                  separatorBuilder: (_, __) => SizedBox(height: 18),
                                  itemBuilder: (context, index) {
                                    final type = CharacterType.values[index];
                                    final list = List<Character>.from(
                                      characters.where((c) => c.type == type),
                                    );
                                    return Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 24),
                                          child: SectionHeaderWidget(
                                            title: type.name,
                                            onPressed: () {},
                                          ),
                                        ),
                                        SizedBox(height: 16),
                                        Container(
                                          height: cardRowHeight,
                                          child: ListView.separated(
                                            itemCount: list.length,
                                            shrinkWrap: true,
                                            padding: const EdgeInsets.symmetric(horizontal: 24),
                                            physics: const ClampingScrollPhysics(),
                                            scrollDirection: Axis.horizontal,
                                            separatorBuilder: (_, __) => SizedBox(width: 16),
                                            itemBuilder: (context, index) {
                                              return CharacterCard(list[index]);
                                            },
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
