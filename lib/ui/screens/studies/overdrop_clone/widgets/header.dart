import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../overdrop_colors.dart';

class Header extends StatelessWidget {
  final String title, subtitle;

  const Header({Key key, @required this.title, @required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle _captionStyle =
        Theme.of(context).textTheme.subtitle1.copyWith(
              fontSize: 17,
              color: OverDropColors.subText,
              letterSpacing: 0.1,
            );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: GoogleFonts.montserrat(
            textStyle: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 27,
              letterSpacing: 0.1,
              color: OverDropColors.headerText,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Text(
            subtitle,
            style: _captionStyle,
          ),
        ),
      ],
    );
  }
}
