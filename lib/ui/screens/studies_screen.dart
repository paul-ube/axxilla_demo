import 'package:axxilla_demo/core/constants/app_colors.dart';
import 'package:axxilla_demo/core/functions/url_launcher.dart';
import 'package:axxilla_demo/ui/screens/studies/overdrop_clone/overdrop_colors.dart';
import 'package:axxilla_demo/ui/screens/studies/travel_demo/travel_demo_screen.dart';
import 'package:axxilla_demo/ui/widgets/cards/studies_card.dart';
import 'package:axxilla_demo/ui/widgets/default_annotated_region.dart';
import 'package:axxilla_demo/ui/widgets/remove_scroll_glow.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../route_paths.dart';

class StudiesScreen extends StatefulWidget {
  @override
  _StudiesScreenState createState() => _StudiesScreenState();

  const StudiesScreen();
}

class _StudiesScreenState extends State<StudiesScreen> {
  @override
  void initState() {
//    Future.microtask(() => TravelDemoScreen());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultAnnotatedRegion(
      child: Scaffold(
        endDrawerEnableOpenDragGesture: false,
        endDrawer: _EndDrawer(axxillaBG: axxillaBG),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          textTheme: GoogleFonts.poppinsTextTheme(),
          title: _AxxillaLogo(),
          backgroundColor: axxillaBG,
        ),
        body: SafeArea(
//        top: false,
          child: ScrollConfiguration(
            behavior: NoScrollGlow(),
            child: ListView(
              padding: const EdgeInsets.all(0),
              children: <Widget>[
                StudiesCard(
                  destination: RoutePaths.travel,
                  title: 'Travel App UI',
                  subtitle: 'A travel app ui inspired by figma',
                  color: primaryBlue,
                  assetImage: 'assets/landscape-4.png',
                ),
                StudiesCard(
                  destination: RoutePaths.discover,
                  title: 'Google Discover and News Clone',
                  subtitle:
                  'Cloning of cards present in Google Discover and News App',
                  color: Colors.white,
                  textColor: Colors.grey.shade900,
                  assetImage: 'assets/portrait-5.png',
                ),
                StudiesCard(
                  destination: RoutePaths.weather,
                  title: 'Overdrop Clone',
                  subtitle: 'A weather forecasting application',
                  color: OverDropColors.background,
                  textColor: Colors.white,
                  assetImage: 'assets/landscape-2.png',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _EndDrawer extends StatelessWidget {
  const _EndDrawer({
    Key key,
    @required this.axxillaBG,
  }) : super(key: key);

  final Color axxillaBG;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        top: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: ScrollConfiguration(
                behavior: NoScrollGlow(),
                child: ListView(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  children: <Widget>[
                    DrawerHeader(
                      child: Container(
                        child: Theme(
                          data: Theme.of(context).copyWith(
                            textTheme: GoogleFonts.poppinsTextTheme(),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                'assets/axxilla_logo.png',
                                height: 50,
                              ),
                              SizedBox(
                                width: 8,
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
                                        .headline4
                                        .apply(
                                          color: Colors.white,
                                        ),
                                  ),
                                  Text(
                                    'IT Solutions',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6
                                        .apply(
                                          color: Colors.white,
                                        ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: axxillaBG,
                      ),
                      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
                    ),
                    _CustomTile(
                      title: 'Contact Us',
                      leadingIcon: Icons.phone_android,
                      onTap: () async {
                        await launchURL('tel:0566471717');
                      },
                    ),
                    _CustomTile(
                      title: 'WhatsApp',
                      leadingIcon: MdiIcons.whatsapp,
                      onTap: () async {
                        await launchURL('whatsapp://send?phone=0566471717');
                      },
                    ),
                    _CustomTile(
                      title: 'Email',
                      subtitle: 'info@axxilla.com',
                      leadingIcon: Icons.mail_outline,
                      onTap: () async {
                        await launchURL(
                          Uri.encodeFull('mailto:info@axxilla.com'),
                        );
                      },
                    ),
                    Divider(
                      endIndent: 16,
                      indent: 16,
                    ),
                    _CustomTile(
                      title: 'Visit Website',
                      leadingIcon: MdiIcons.web,
                      onTap: () async {
                        await launchURL('http://www.axxilla.com/');
                      },
                    ),
                    _CustomTile(
                      title: 'Visit on Facebook',
                      leadingIcon: MdiIcons.facebook,
                      onTap: () async {
                        await launchURL(
                            'https://www.facebook.com/axxilla.solutions/?modal=admin_todo_tour');
                      },
                    ),
                    Divider(
                      endIndent: 16,
                      indent: 16,
                    ),
                    _CustomAboutTile(
                      title: 'About Axxilla Demo',
                      icon: Image.asset(
                        'assets/axxilla_logo.png',
                        height: 24,
                        color: Colors.grey[700],
                      ),
                      applicationIcon: Image.asset(
                        'assets/axxilla_logo.png',
                        height: 32,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 0, 16),
                child: Text('© Axxilla IT Solutions by HSEPro FZE',
                    style: Theme.of(context).textTheme.caption)),
          ],
        ),
      ),
    );
  }
}

class _AxxillaLogo extends StatelessWidget {
  final double iconHeight;
  final double iconRightPad;

  const _AxxillaLogo({Key key, this.iconHeight = 24, this.iconRightPad = 16})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'assets/axxilla_logo.png',
            height: iconHeight,
          ),
          SizedBox(
            width: iconRightPad,
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
    );
  }
}

class _CustomTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData leadingIcon;
  final Function onTap;
  final Widget trailing;

  const _CustomTile({
    Key key,
    this.title,
    this.leadingIcon,
    this.onTap,
    this.trailing,
    this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _subtitleWidget;
    if (subtitle != null) {
      _subtitleWidget = Text(subtitle);
    }

    return ListTile(
      leading: Icon(
        leadingIcon,
        color: Colors.grey[700],
      ),
      trailing: trailing,
      contentPadding: EdgeInsets.symmetric(horizontal: 16),
      title: Text(title,
          style: Theme.of(context)
              .textTheme
              .headline6
              .apply(fontSizeDelta: -4, color: Colors.grey[700])),
      subtitle: _subtitleWidget,
      dense: subtitle != null,
      onTap: onTap,
    );
  }
}

class _CustomAboutTile extends StatelessWidget {
  final String title;
  final String applicationName, applicationVersion;
  final Widget applicationIcon;
  final Widget icon;

  const _CustomAboutTile(
      {Key key,
      this.title,
      this.applicationName,
      this.applicationVersion,
      this.applicationIcon,
      this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: icon,
        contentPadding: EdgeInsets.symmetric(horizontal: 16),
        title: Text(title,
            style: Theme.of(context)
                .textTheme
                .headline6
                .apply(fontSizeDelta: -4, color: Colors.grey[700])),
        dense: false,
        onTap: () {
          showAboutDialog(
              context: context,
              applicationIcon: applicationIcon,
              applicationName: applicationName,
              applicationVersion: applicationVersion);
        });
  }
}
