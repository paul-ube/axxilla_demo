import 'dart:math';

import 'package:axxilla_demo/core/constants/constants.dart';
import 'package:axxilla_demo/main.dart';
import 'package:axxilla_demo/ui/widgets/cards/google_discover_card.dart';
import 'file:///C:/Users/Paul/AndroidStudioProjects/axxilla_demo/lib/ui/widgets/logo_and_name_caption.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class FirstRow extends StatefulWidget {
  final String title;
  final double height;

  const FirstRow({Key key, this.height = 300, @required this.title})
      : super(key: key);

  @override
  _FirstRowState createState() => _FirstRowState();
}

class _FirstRowState extends State<FirstRow> {
  bool hasCaption = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 0, 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Consumer<RowSettings>(
                builder: (context, model, child) => Text(widget.title,
                    style: Theme.of(context).textTheme.headline5),
              ),
              IconButton(
                icon: Icon(LineAwesomeIcons.gear),
                onPressed: () {
                  showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (BuildContext context) {
                        return _BottomSheet();
                      });
                },
              ),
            ],
          ),
        ),
        Container(
          height: widget.height,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 6,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              String _picsumImageString =
                  'https://picsum.photos/${widget.height.toInt()}/${widget.height.toInt()}?random=$index';
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
                margin: EdgeInsets.fromLTRB(
                    index == 0 ? 16 : 12, 8, index == 5 ? 16 : 4, 16),
                child: index % 2 == 0
                    ? GoogleDiscoverCard(
                        height: widget.height,
                      )
                    : _SquareCard(picsumImageString: _picsumImageString),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _SquareCard extends StatelessWidget {
  const _SquareCard({
    Key key,
    @required String picsumImageString,
  })  : _picsumImageString = picsumImageString,
        super(key: key);

  final String _picsumImageString;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.loose,
      children: [
        Container(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(kBorderRadius),
            child: FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: _picsumImageString,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Consumer<RowSettings>(
          builder: (context, model, child) {
            return Positioned.fill(
              child: _AnimatedContainer(model: model),
            );
          },
        ),
      ],
    );
  }
}

class _AnimatedContainer extends StatelessWidget {
  final RowSettings model;

  const _AnimatedContainer({
    Key key,
    this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 1000),
      decoration: !model.hasCaption ? kNoBoxDecoration : kOverlayDecoration,
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                !model.hasCaption ? '' : 'Test Caption',
                style: Theme.of(context)
                    .textTheme
                    .subtitle2
                    .apply(color: Colors.white),
              ),
              Text(
                !model.hasCaption ? '' : 'This is a test caption',
                style: Theme.of(context)
                    .textTheme
                    .caption
                    .apply(color: Colors.white70),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: kWhiteColor,
      ),
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(8),
      child: Consumer<RowSettings>(
        builder: (context, model, child) => SwitchListTile(
          title: Text('list tile'),
          value: model.hasCaption,
          onChanged: (bool value) {
            model.switchHasCaption(value);
          },
        ),
      ),
    );
  }
}




