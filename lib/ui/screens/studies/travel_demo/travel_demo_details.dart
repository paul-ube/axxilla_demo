import 'package:axxilla_demo/core/constants/app_colors.dart';
import 'package:axxilla_demo/core/constants/constants.dart';
import 'package:axxilla_demo/core/functions/url_launcher.dart';
import 'package:axxilla_demo/ui/widgets/appbar/sliver_app_bar_title.dart';
import 'package:axxilla_demo/ui/widgets/components/category_title.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'model/discover_item.dart';


class TravelDemoDetails extends StatelessWidget {
  final DiscoverItemModel discoverItem;
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
            backgroundColor: primaryBlue,
            expandedHeight: MediaQuery.of(context).size.longestSide * 0.3,
            titleSpacing: 0.0,
            pinned: true,
            title: SliverAppBarTitle(
              child: Text(
                discoverItem.title,
                style: _textTheme.headline6.copyWith(
                  color: Colors.white,
                  letterSpacing: 0.2,
                ),
                maxLines: 1,
              ),
            ),
            actions: <Widget>[
              PopupMenuButton<String>(
                offset: Offset(0.0, 8.0),
                onSelected: (String value) {
                  if (value == 'Help') {
                    launchURL(
                      Uri.encodeFull('mailto:developer@hsepro.org?'),
                    );
                  }
                },
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  const PopupMenuItem(
                    child: Text('Help & Feedback'),
                    value: 'Help',
                  )
                ],
              )
            ],
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
//                          stops: [0, 0.5, 0.95],
                          colors: [
                            Colors.black,
                            Colors.black.withOpacity(0),
                            Colors.black,
                          ],
                        ),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(16.0),
                        width: MediaQuery.of(context).size.width,
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Column(
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text(
                                    '${discoverItem.rating}',
                                    style: _textTheme.subtitle2.copyWith(
                                      color: Colors.white,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 1.0),
                                    child: Icon(Icons.star,
                                        color: Colors.white, size: 14),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 6,
                                    ),
                                    child: Text(
                                      '·',
                                      style: _textTheme.subtitle2.copyWith(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      '${discoverItem.reviewCount} Reviews',
                                      style: _textTheme.subtitle2.copyWith(
                                        color: Colors.white70,
                                      ),
                                    ),
                                  ),
                                ],
                              )
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
          SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return ListView(
                padding: EdgeInsets.zero,
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                children: <Widget>[
                  _TravelInitialDetails(
                    data: [
                      IconName(
                        discoverItem.cost,
                        Icons.monetization_on,
                      ),
                      IconName(
                        discoverItem.time,
                        Icons.access_time,
                      ),
                      IconName(
                        discoverItem.location,
                        Icons.location_on,
                      ),
                      IconName(discoverItem.type, discoverItem.typeIcon),
                    ],
                  ),
                  DetailBlock(
                    title: 'Description',
                  ),
                  Divider(
                    endIndent: 16,
                    indent: 16,
                    height: 40,
                  ),
                  CategoryTitle(
                    title: 'Photos',
                  ),
                  _buildPhotos(),
                  DetailBlock(
                    title: 'Additional Notes',
                  ),
                  DetailBlock(
                    title: 'Requirements',
                    desc: 'Ages 7 up can attend. Any skill level welcome.',
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
                  ),
                  DetailBlock(
                    title: 'Requirements',
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
                  ),
                  DetailBlock(
                    title: 'Requirements',
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
                  ),
                  DetailBlock(
                    title: 'Requirements',
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
                  ),
                ],
              );
            }, childCount: 1),
          )
        ],
      ),
    );
  }

  Padding _buildPhotos() {
    int imageLength = 5;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        height: 220,
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: imageLength,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                decoration: BoxDecoration(
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
                margin: EdgeInsets.fromLTRB(index == 0 ? 16 : 12, 8,
                    index == imageLength - 1 ? 16 : 4, 8),
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kBorderRadius),
                    color: Colors.white,
                  ),
                  child: Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(kBorderRadius),
                      child: Image.asset(
                        'assets/landscape-${index + 1}.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}

class _TravelInitialDetails extends StatelessWidget {
  final List<IconName> data;

  const _TravelInitialDetails({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          padding: const EdgeInsets.fromLTRB(16, 16, 4, 4),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                data[index].icon,
                color: Colors.black45,
                size: 20,
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Text(
                  '${data[index].title}',
                  style: Theme.of(context).textTheme.subtitle2,
                  maxLines: 1,
                ),
              ),
            ],
          ),
        );
//        return ListTile(
//          leading: Icon(
//            data[index].icon,
//            color: Colors.black45,
//          ),
//          title: Text('${data[index].title}'),
//          dense: true,
//        );
      },
    );
  }
}

class DetailBlock extends StatelessWidget {
  final String title;
  final String desc;
  final EdgeInsets padding;

  const DetailBlock(
      {Key key,
      this.title,
      this.desc = kLoremIpsum,
      this.padding = const EdgeInsets.fromLTRB(16, 16, 16, 8)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Divider(
          endIndent: 16,
          indent: 16,
          height: 40,
        ),
        CategoryTitle(
          title: title,
        ),
        Padding(
          padding: padding,
          child: Text(
            desc,
            style: Theme.of(context).textTheme.bodyText2.copyWith(
                  height: 1.47,
                  color: Colors.black54,
                ),
            maxLines: 5,
          ),
        )
      ],
    );
  }
}

class IconName {
  final String title;
  final IconData icon;

  IconName(this.title, this.icon);
}
