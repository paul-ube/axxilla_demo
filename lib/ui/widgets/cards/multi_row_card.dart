import 'dart:math';

import 'package:axxilla_demo/core/constants/constants.dart';
import 'package:axxilla_demo/ui/widgets/components/square_image.dart';
import 'package:axxilla_demo/ui/widgets/logo_and_name_caption.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

List<String> _times = <String>['hours', 'months', 'minutes'];

class MultiRowCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextTheme _textTheme = Theme.of(context).textTheme;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(kBorderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.25),
            offset: const Offset(1.7, 1.7),
            blurRadius: 6,
            spreadRadius: -0.5,
          ),
          BoxShadow(
            blurRadius: 10,
            color: Colors.grey.withOpacity(.1),
            offset: Offset(2, 2),
          ),
        ],
      ),
      margin: const EdgeInsets.all(16),
      child: Material(
        type: MaterialType.transparency,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _article(_textTheme,
                title: 'A multi-row card inspired by Google News',
                iconData: MdiIcons.googleNearby,
                logoName: 'Google News'),
            _article(
              _textTheme,
              title:
                  'Microsoft Surface Book 3 15-inch review: Better, faster, but don\'t call it \'ultimate\'',
              endIndent: 0,
              indent: 0,
              logoName: 'Test Logo Name',
            ),
            Container(
              width: double.infinity,
              child: FlatButton.icon(
                materialTapTargetSize: MaterialTapTargetSize.padded,
                onPressed: () {},
                icon: Icon(MdiIcons.googleCardboard),
                label: Text(
                  'View Full Coverage',
                  style: _textTheme.button,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _article(
    TextTheme _textTheme, {
    String title,
    String logoName = 'Test',
    double indent = 20,
    double endIndent = 20,
    IconData iconData = Icons.code,
  }) {
    return InkWell(
      onTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      LogoAndName(
                        name: logoName,
                        icon: iconData,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 4,
                        softWrap: true,
                        style: _textTheme.subtitle1
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                SquareImage(
                  height: 90,
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  '${Random().nextInt(24)} '
                  '${_times[Random().nextInt(_times.length)]} ago',
                  style: _textTheme.caption.apply(
                    color: Colors.black54,
                  ),
                ),
              ),
              Spacer(),
              IconButton(
                visualDensity: VisualDensity.comfortable,
                icon: Icon(Icons.more_vert),
                iconSize: 20,
                color: Colors.black45,
                onPressed: () {},
              ),
            ],
          ),
          Divider(
            height: 0,
            endIndent: endIndent,
            indent: indent,
          ),
        ],
      ),
    );
  }
}
