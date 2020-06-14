import 'package:axxilla_demo/core/constants/app_colors.dart';
import 'package:axxilla_demo/core/constants/constants.dart';
import 'package:axxilla_demo/core/functions/url_launcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TravelDemoArticles extends StatelessWidget {
  final String title;
  final String imageAsset;

  const TravelDemoArticles({Key key, @required this.title, this.imageAsset})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme _textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: primaryBlue,
            titleSpacing: 0.0,
            pinned: false,
            floating: true,
            title: Text(
              title,
              style: _textTheme.headline6.copyWith(
                color: Colors.white,
                letterSpacing: 0.2,
              ),
              maxLines: 1,
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
                itemBuilder: (BuildContext context) =>
                    <PopupMenuEntry<String>>[
                  const PopupMenuItem(
                    child: Text('Help & Feedback'),
                    value: 'Help',
                  )
                ],
              )
            ],
          ),
          SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return Scrollbar(
                child: ListView(
                  padding: EdgeInsets.zero,
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  children: <Widget>[
                    AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Image.asset(
                        imageAsset,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            title,
                            style: _textTheme.headline5.copyWith(
                              fontWeight: FontWeight.w700,
                              letterSpacing: -0.2,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text('6 days ago',
                              style: _textTheme.caption
                                  .apply(color: Colors.grey.shade500)),
                          const SizedBox(height: 24),
                          Divider(
                            height: 0,
                          ),
                          const SizedBox(height: 4),
                        ],
                      ),
                    ),
                    ListView.builder(
                      padding: EdgeInsets.zero,
                      physics: ClampingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 20,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                            padding: const EdgeInsets.fromLTRB(16, 4, 16, 12),
                            child: Text(
                              kLoremIpsum,
                              style: _textTheme.bodyText2
                                  .copyWith(height: 1.55, fontSize: 16),
                            ));
                      },
                    ),
                  ],
                ),
              );
            }, childCount: 1),
          )
        ],
      ),
    );
  }
}
