import 'package:bloc_generic_streams/bloc_generic_streams.dart';
import 'package:flutter/material.dart';
import 'package:marvel_heroes/marvel_heroes/app/pages/home/marvel_home_bloc.dart';

import '../character_type.dart';
import 'character_category.dart';

class CategoriesRow extends StatelessWidget {
  const CategoriesRow({@required this.categories, this.itemSize = 60})
      : assert(categories != null),
        assert(categories.length > 0);

  final List<CharCategory> categories;
  final double itemSize;

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<MarvelHomeBloc>(context);
    return Container(
      height: itemSize,
      child: StreamBuilder<CharacterType>(
        stream: bloc.filter.stream,
        builder: (context, snapshot) {
          final filtered = snapshot.data;
          return ListView.separated(
            itemCount: categories.length,
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (_, __) => SizedBox(width: 12),
            itemBuilder: (context, index) {
              final category = categories[index];
              final selected = category.type == filtered;
              return GestureDetector(
                onTap: selected ? () => bloc.filter.sink.add(null) : () => bloc.filter.sink.add(category.type),
                child: Container(
                  width: itemSize - 4,
                  height: itemSize - 4,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: category.gradient.colors.first.withOpacity(.08),
                        offset: const Offset(0, 12),
                        blurRadius: 12,
                        spreadRadius: 0,
                      ),
                    ],
                    color: (filtered == null || selected) ? null : Colors.white,
                    gradient: (filtered == null || selected)
                        ? category.gradient
                        : LinearGradient(
                            colors: [Colors.grey, Colors.white],
                            end: Alignment.topCenter,
                            begin: Alignment.bottomCenter,
                          ),
                  ),
                  alignment: Alignment.center,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 400),
                    child: ShaderMask(
                      shaderCallback: (bounds) => LinearGradient(
                        colors: (filtered == null || selected)
                            ? [Colors.white, Colors.white]
                            : [
                                Colors.grey,
                                Colors.grey,
                              ],
                      ).createShader(bounds),
                      blendMode: BlendMode.srcATop,
                      child: category.icon,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
