import 'package:flutter/material.dart';
import 'package:movies_proyect/model/movie_detail.dart';
import 'package:movies_proyect/model/movies.dart';
import 'package:movies_proyect/util/utils.dart';

class AboutSection extends StatelessWidget {
  final MovieDetail data;

  AboutSection(this.data);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "About",
          style: TextStyle(color: Colors.white),
        ),
        Container(
          height: 8.0,
        ),
        _getSectionOrContainer('Original Title', data.original_title),
        _getSectionOrContainer('Status', data.status),
        _getSectionOrContainer('Runtime', data.runtime,
            formatterFunction: formatRuntime),
        _getSectionOrContainer('Budget', data.budget,
            formatterFunction: formatNumberToDollars),
        _getSectionOrContainer('Revenue', data.revenue,
            formatterFunction: formatNumberToDollars),
        _getSectionOrContainer('Homepage', data.homepage, isLink: true),
        _getSectionOrContainer('Imdb', data.imdb_id,
            formatterFunction: getImdbUrl, isLink: true),
      ],
    );
  }

  Widget _getSectionOrContainer(String title, dynamic content,
      {dynamic formatterFunction, bool isLink: false}) {
    return _getMetaInfoSection(title,
        (formatterFunction != null ? formatterFunction(content) : content),
        isLink: isLink);
  }

  Widget _getMetaInfoSection(String title, String content,
      {bool isLink: false}) {
    if (content == null) return Container();

    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Text(
                '$title:',
                style: TextStyle(color: Colors.grey, fontSize: 11.0),
              ),
            ),
            Expanded(
              flex: 4,
              child: GestureDetector(
                onTap: () => isLink ? launchUrl(content) : null,
                child: Text(
                  content,
                  style: TextStyle(
                      color: isLink ? Colors.blue : Colors.white,
                      fontSize: 11.0),
                ),
              ),
            ),
          ],
        ));
  }
}
