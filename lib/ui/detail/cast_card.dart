import 'package:flutter/material.dart';
import 'package:movies_proyect/model/cast.dart';
import 'package:movies_proyect/util/bottom_gradient.dart';

class CastCard extends StatelessWidget {
  final double height;
  final double width;
  final Cast cast;

  CastCard(this.cast, {this.height: 140.0, this.width: 100.0});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //onTap: () => ,
      child: Container(
        height: height,
        width: width,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Hero(
              tag: 'Cast-Hero-${cast.id}',
              child: FadeInImage.assetNetwork(
                placeholder: 'assets/placeholder.jpg',
                image: cast.profilePictureUrl,
                fit: BoxFit.cover,
                height: height,
                width: width,
              ),
            ),
            BottomGradient.noOffset(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    cast.name,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 10.0),
                  ),
                  Container(
                    height: 4.0,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                          child: Icon(
                        Icons.person,
                        color: Color(0xFFF47663),
                        size: 10.0,
                      )),
                      Container(
                        width: 4.0,
                      ),
                      Expanded(
                        flex: 8,
                        child: Text(cast.character,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 8.0)),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
