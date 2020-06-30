import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WeatherScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        textTheme: GoogleFonts.montserratTextTheme(),
      ),
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          addAutomaticKeepAlives: true,
          children: <Widget>[

          ],
        ),
      ),
    );
  }
}
