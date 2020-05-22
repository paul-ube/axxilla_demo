import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class LogoAndName extends StatelessWidget {
  final String name;
  final String relativeDate;
  final IconData icon;

  LogoAndName({
    Key key,
    this.name,
    this.relativeDate,
    this.icon = MdiIcons.googlePlay,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 4),
          child: Icon(
            icon,
            size: 18,
          ),
        ),
        Text(
          name,
          style: Theme.of(context).textTheme.caption,
        ),
        relativeDate == null
            ? const SizedBox.shrink()
            : _relativeDate(context, relativeDate),
      ],
    );
  }

  Row _relativeDate(BuildContext context, String date) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Text(
            '•',
            style: Theme.of(context)
                .textTheme
                .caption
                .apply(color: Colors.black38),
          ),
        ),
        Text(
          date,
          style: Theme.of(context).textTheme.caption,
        )
      ],
    );
  }
}
