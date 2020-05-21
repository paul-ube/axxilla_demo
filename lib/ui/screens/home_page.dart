import 'package:axxilla_demo/ui/widgets/first_page/first_row.dart';
import 'package:axxilla_demo/ui/widgets/first_page/second_row.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';


class HomePage extends StatefulWidget {
  const HomePage({
    Key key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
//      shrinkWrap: true,
      slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          titleSpacing: 0.0,
          elevation: 2,
          expandedHeight: 130,
          flexibleSpace: FlexibleSpaceBar(
            titlePadding: const EdgeInsetsDirectional.fromSTEB(22, 16, 0, 16),
            title: Text('Home'),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(LineAwesomeIcons.info_circle),
              onPressed: () {},
              color: Colors.grey[800],
            )
          ],
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((BuildContext context, int _) {
            return ListView(
              padding: EdgeInsets.zero,
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              children: <Widget>[
                FirstRow(height: 200.toDouble(), title: 'First Row'),
                SecondRow(title: 'Second Row'),
              ],
            );
          }, childCount: 1),
        ),
      ],
    );
  }
}
