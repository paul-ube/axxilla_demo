import 'package:axxilla_demo/ui/widgets/cards/google_discover_card.dart';
import 'package:axxilla_demo/ui/widgets/cards/multi_row_card.dart';
import 'package:axxilla_demo/ui/widgets/cards/spotify_list_tile.dart';
import 'package:axxilla_demo/ui/widgets/components/backdrop/backdrop.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  static const List<String> _tabs = <String>[
    "Cards",
    "Backdrop",
    "Courses",
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: _tabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerScrolled) {
          return <Widget>[
            SliverAppBar(
              pinned: true,
              titleSpacing: 22,
              elevation: 2,
              expandedHeight: 130,
title: Text('Home'),
//              flexibleSpace: FlexibleSpaceBar(
//                titlePadding:
//                    const EdgeInsetsDirectional.fromSTEB(22, 16, 0, 16),
//                title: Text('Home'),
//              ),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(kTextTabBarHeight),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 6),
//                          decoration: Constants.cardDecoration,
                  child: TabBar(
                    controller: _tabController,
                    labelStyle: Theme.of(context).textTheme.button,
                    unselectedLabelColor:
                        Theme.of(context).colorScheme.onSurface,
                    labelColor: Colors.black,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorColor: Colors.black,
                    indicator: UnderlineTabIndicator(
                        borderSide: BorderSide(
                      color: Colors.black,
                      width: 2,
                    )),
                    isScrollable: true,
                    labelPadding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                    ),
                    tabs: _tabs
                        .map((String name) => Tab(
                              text: name,
                            ))
                        .toList(),
                  ),
                ),
              ),
              actions: <Widget>[
                IconButton(
                  icon: Icon(LineAwesomeIcons.info_circle),
                  onPressed: () {},
                  color: Colors.grey[800],
                )
              ],
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            _Cards(),
            _Cards(),
            _Cards(),
          ],
        ),
      ),
    );
  }
}

class _Cards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: ClampingScrollPhysics(),
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildBuilderDelegate((BuildContext context, int _) {
            return ListView(
              padding: EdgeInsets.zero,
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              children: <Widget>[
//                FirstRow(height: 200.toDouble(), title: 'First Row'),
//                SecondRow(title: 'Second Row'),
                Container(
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
                    margin: EdgeInsets.fromLTRB(16, 12, 16, 4),
                    child: GoogleDiscoverCard()),
                MultiRowCard(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 4, 16, 12),
                  child: SpotifyListTile(),
                ),
              ],
            );
          }, childCount: 1),
        )
      ],
    );
  }
}
