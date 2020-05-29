import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AxxillaClone extends StatefulWidget {
  @override
  _AxxillaCloneState createState() => _AxxillaCloneState();
}

class _AxxillaCloneState extends State<AxxillaClone> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        textTheme: GoogleFonts.poppinsTextTheme(),
        accentColor: Colors.amber,
        primaryColor: Colors.white,
      ),
      child: Builder(
        builder: (BuildContext context) {
          TextTheme _textTheme = Theme.of(context).textTheme;

          return Scaffold(
            backgroundColor: Colors.white,
            extendBodyBehindAppBar: true,
            extendBody: true,
            appBar: AppBar(
              textTheme: GoogleFonts.poppinsTextTheme(),
              backgroundColor: Colors.transparent,
              title: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/axxilla_logo.png',
                    height: 24,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Axxilla',
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            .apply(color: Colors.white, fontSizeDelta: 2),
                      ),
                      Text(
                        'IT Solutions',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2
                            .apply(color: Colors.white, fontSizeDelta: -2),
                      )
                    ],
                  )
                ],
              ),
              actions: <Widget>[
                PopupMenuButton<String>(
                  offset: Offset(0.0, 8.0),
                  onSelected: (String value) {
                    if (value == 'Help') {}
                  },
                  icon: Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<String>>[
                    const PopupMenuItem(
                      child: Text('Help & Feedback'),
                      value: 'Help',
                    )
                  ],
                ),
              ],
            ),
            body: Stack(
              fit: StackFit.expand,
              overflow: Overflow.clip,
              children: <Widget>[
                Image.asset(
                  'assets/introduction_image0.jpg',
                  fit: BoxFit.cover,
                ),
                Positioned(
                  left: 20,
                  top: MediaQuery.of(context).size.height / 3,
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Welcome to our\nIT Solutions',
                          style:
                              _textTheme.subtitle1.apply(color: Colors.white),
                        ),

//                        Divider(
//
//                          color: Colors.amber,
//                            endIndent: MediaQuery.of(context).size.width * 0.7),
                        Container(
                          width: MediaQuery.of(context).size.width - 20,
                          padding: const EdgeInsets.only(right: 20),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 32.0, bottom: 32),
                                  child: RichText(
                                    maxLines: 2,
                                    softWrap: true,
                                    text: TextSpan(
                                        text: 'HELLO, ',
                                        style: _textTheme.headline3.copyWith(
                                            color: Colors.amber,
                                            fontWeight: FontWeight.w900,
                                            letterSpacing: 0.1,
                                            height: 1),
                                        children: [
                                          TextSpan(
                                            text: 'I AM AXXILLA',
                                            style: _textTheme.headline3.apply(
                                                color: Colors.white,
                                                fontWeightDelta: 5),
                                          )
                                        ]),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 4,
                          width: MediaQuery.of(context).size.width * 0.2,
                          color: Colors.amber,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
