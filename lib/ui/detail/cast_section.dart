import 'package:flutter/material.dart';
import 'package:movies_proyect/ui/detail/cast_card.dart';

import '../../model/cast.dart';

class CastSection extends StatelessWidget {
  final List<Cast> _cast;

  CastSection(this._cast);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Cast",
          style: TextStyle(color: Colors.white),
        ),
        Container(
          height: 8.0,
        ),
        Container(
          height: 140.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: _cast
                .map((Cast cast) => Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: CastCard(cast),
                    ))
                .toList(),
          ),
        )
      ],
    );
  }
}
