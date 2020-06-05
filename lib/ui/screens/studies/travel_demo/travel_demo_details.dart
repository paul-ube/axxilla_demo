import 'package:axxilla_demo/core/constants/app_colors.dart';
import 'package:axxilla_demo/ui/widgets/discover_things.dart';
import 'package:axxilla_demo/ui/widgets/icon_plus_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class TravelDemoDetails extends StatelessWidget {
  final DiscoverItem discoverItem;
  final String imageAsset;

  const TravelDemoDetails({Key key, this.discoverItem, this.imageAsset})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme _textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.longestSide * 0.3,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    imageAsset,
                    fit: BoxFit.cover,
                  ),
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0, 0.2, 0.95],
                          colors: [
                            Colors.black54,
                            Colors.transparent,
                            Colors.black,
                          ],
                        ),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(16.0),
                        width: MediaQuery.of(context).size.width,
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 30,
                                    child: Text(
                                      discoverItem.title.substring(0, 1),
                                      style: _textTheme.headline4.copyWith(
                                        color: primaryBlue,
                                      ),
                                    ),
//                                    backgroundImage: AssetImage(imageAsset),
                                  )
                                ],
                              ),
                              const SizedBox(width: 24),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Text(
                                    discoverItem.title,
                                    style: _textTheme.headline6.copyWith(
                                      color: Colors.white,
                                      letterSpacing: 0.2,
                                    ),
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          SmoothStarRating(
                                            rating:
                                                discoverItem.rating.toDouble(),
                                            isReadOnly: true,
                                            size: 16,
                                            filledIconData: Icons.star,
                                            halfFilledIconData: Icons.star_half,
                                            defaultIconData: Icons.star_border,
                                            color: orangeAccent,
                                            borderColor: orangeAccent,
                                            starCount: 5,
                                            allowHalfRating: true,
                                            spacing: 2.0,
                                            onRated: (value) {},
                                          ),
                                          Flexible(
                                            child: Text(
                                              '${discoverItem.reviewCount} Reviews',
                                              style: _textTheme.subtitle2
                                                  .copyWith(
                                                      color: Colors.white),
                                            ),
                                          )
                                        ],
                                      ),
                                      const SizedBox(width: 16),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          Flexible(
                                            child: Container(
                                              padding: const EdgeInsets.only(
                                                  bottom: 8.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: <Widget>[
                                                  IconPlusName(
                                                    icon: Icons.monetization_on,
                                                    name: discoverItem.cost,
                                                    iconColor: Colors.white,
                                                    textStyle: _textTheme
                                                        .caption
                                                        .apply(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 16),
                                                  IconPlusName(
                                                    icon: Icons.access_time,
                                                    name: discoverItem.time,
                                                    iconColor: Colors.white,
                                                    textStyle: _textTheme
                                                        .caption
                                                        .apply(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: <Widget>[
                                                IconPlusName(
                                                  icon: Icons.monetization_on,
                                                  name: discoverItem.cost,
                                                  iconColor: Colors.white,
                                                  textStyle:
                                                      _textTheme.caption.apply(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                const SizedBox(width: 16),
                                                IconPlusName(
                                                  icon: Icons.access_time,
                                                  name: discoverItem.time,
                                                  iconColor: Colors.white,
                                                  textStyle:
                                                      _textTheme.caption.apply(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
