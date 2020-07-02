import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import 'header.dart';

class WeatherRadarSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
          child: Header(title: 'Weather radar', subtitle: 'Satellite images'),
        ),
        const SizedBox(height: 16),
        Container(
          margin: const EdgeInsets.fromLTRB(24, 0, 24, 0),
          width: double.infinity,
          height: 200,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: 'https://picsum.photos/id/1042/300/200',
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        const SizedBox(height: 38),
      ],
    );
  }
}
