import 'package:axxilla_demo/core/constants/constants.dart';
import 'package:axxilla_demo/ui/widgets/components/square_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class SpotifyListTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: kCardDecoration.copyWith(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Material(
          type: MaterialType.transparency,
          child: Row(
            children: <Widget>[
              Stack(
                children: [
                  SquareImage(
                    height: 80,
                    padding: EdgeInsets.zero,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                  ),
                  Positioned.fill(
                    child: Center(
                      child: Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 12, 0, 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Spotify List Tile',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                      Text(
                        kLoremIpsum,
                        maxLines: 1,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .caption
                            .apply(fontSizeDelta: 1),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  IconButton(
                    visualDensity: VisualDensity.compact,
                    icon: Icon(FeatherIcons.heart),
                    iconSize: 24,
                    color: Colors.black54,
                    onPressed: () {},
                  ),
                  IconButton(
                    visualDensity: VisualDensity.compact,
                    icon: Icon(FeatherIcons.minusCircle),
                    iconSize: 24,
                    color: Colors.black54,
                    onPressed: () {},
                  ),
                  IconButton(
                    visualDensity: VisualDensity.compact,
                    icon: Icon(FeatherIcons.moreVertical),
                    iconSize: 24,
                    color: Colors.black54,
                    onPressed: () {},
                  )
                ],
              )
            ],
          ),
        ));
  }
}
