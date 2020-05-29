import 'package:axxilla_demo/core/constants/constants.dart';
import 'package:axxilla_demo/ui/widgets/components/square_image.dart';
import 'package:axxilla_demo/ui/widgets/logo_and_name_caption.dart';
import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

class GoogleDiscoverCard extends StatelessWidget {
  final double height;

  const GoogleDiscoverCard({Key key, this.height = 200}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme _textTheme = Theme.of(context).textTheme;
    return Container(
      height: height,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kBorderRadius),
        color: Colors.white,
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: () {},
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Flexible(
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'This is a wide card inspired by Google Feed',
                                    maxLines: 2,
                                    style: _textTheme.headline6,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    kLoremIpsum,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: _textTheme.bodyText2.copyWith(
                                        height: 1.4, color: Colors.black54),
                                  ),
                                ]),
                          ],
                        ),
                      ),
                    ),
                    SquareImage(height: height / 2),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: LogoAndName(
                      name: 'Google',
                      relativeDate: '3 hours ago',
                    ),
                  ),
                  Spacer(),
                  Row(
                    children: <Widget>[
                      IconButton(
                        visualDensity: VisualDensity.comfortable,
                        icon: Icon(OMIcons.share),
                        iconSize: 18,
                        color: Colors.black54,
                        onPressed: () {},
                      ),
                      IconButton(
                        visualDensity: VisualDensity.comfortable,
                        icon: Icon(Icons.filter_list),
                        iconSize: 18,
                        color: Colors.black54,
                        onPressed: () {},
                      ),
                      IconButton(
                        visualDensity: VisualDensity.comfortable,
                        icon: Icon(Icons.more_vert),
                        iconSize: 18,
                        color: Colors.black54,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
