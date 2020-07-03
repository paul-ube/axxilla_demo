import 'dart:async';

import 'package:axxilla_demo/core/constants/constants.dart';
import 'package:axxilla_demo/routes.dart';
import 'package:axxilla_demo/ui/screens/studies/overdrop_clone/change_notifier_provider.dart';
import 'package:axxilla_demo/ui/screens/studies_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:sentry/sentry.dart';

SentryClient _sentry;

bool get isInDebugMode {
  bool inDebugMode = false;
  assert(inDebugMode = true);
  return inDebugMode;
}

Future<Null> _reportError(dynamic error, dynamic stackTrace) async {
  print('Caught error: $error');

  // Errors thrown in development mode are unlikely to be interesting. You can
  // check if you are running in dev mode using an assertion and omit sending
  // the report.
  if (isInDebugMode) {
    print(stackTrace);
    print('In dev mode. Not sending report to Sentry.io.');
    return;
  }

  final SentryResponse response = await _sentry.captureException(
    exception: error,
    stackTrace: stackTrace,
  );
}

Future<void> main() async {
  await DotEnv().load('.env');
  _sentry = new SentryClient(
    dsn: DotEnv().env['dsn'],
  );

  FlutterError.onError = (FlutterErrorDetails details) async {
    if (isInDebugMode) {
      // In development mode simply print to console.
      FlutterError.dumpErrorToConsole(details);
    } else {
      // In production mode report to the application zone to report to
      // Sentry.
      Zone.current.handleUncaughtError(
        details.exception,
        details.stack,
      );
    }
  };

  runZonedGuarded<Future<Null>>(() async {
    initializeDateFormatting().then((_) => runApp(
          MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) => RowSettings()),
              ChangeNotifierProvider(create: (_) => SelectedIndex()),
            ],
            child: MyApp(),
          ),
        ));
  }, (error, stackTrace) async {
    await _reportError(error, stackTrace);
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: MaterialApp(
        title: 'Axxilla Demo',
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          splashFactory: InkRipple.splashFactory,
          primarySwatch: Colors.blueGrey,
          appBarTheme: AppBarTheme(
            color: kBackgroundColor,
            elevation: 0,
          ),
          scaffoldBackgroundColor: kBackgroundColor,
          pageTransitionsTheme: PageTransitionsTheme(builders: {
            TargetPlatform.android: ZoomPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          }),
        ),
//        home: StudiesScreen(),
        onGenerateRoute: RouteConfiguration.onGenerateRoute,
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
//  int _selectedIndex = 0;

//  List<Widget> pageList = <Widget>[
//    StudiesScreen(),
//    GoogleDiscoverClone(
//      key: PageStorageKey(0),
//    ),
//    SettingsPage(),
//  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: false,
      body: StudiesScreen(),
    );
  }

//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      extendBody: true,
//      body: PageTransitionSwitcher(
//        transitionBuilder: (
//          Widget child,
//          Animation<double> animation,
//          Animation<double> secondaryAnimation,
//        ) {
//          return FadeThroughTransition(
//            animation: animation,
//            secondaryAnimation: secondaryAnimation,
//            child: child,
//          );
//        },
//        child: pageList[_selectedIndex],
//      ),
//      bottomNavigationBar: Container(
//        margin: const EdgeInsets.all(8),
//        decoration: BoxDecoration(
//          borderRadius: BorderRadius.circular(100),
//          color: Colors.white,
//          boxShadow: [
//            BoxShadow(
//              blurRadius: 20,
//              color: Colors.grey.withOpacity(.1),
//            ),
//            BoxShadow(
//              blurRadius: 10,
//              color: Colors.grey.withOpacity(.1),
//              offset: Offset(2, 2),
//            ),
//          ],
//        ),
//        child: SafeArea(
//          child: Padding(
//            padding: const EdgeInsets.all(8),
//            child: GNav(
//                gap: 20,
//                activeColor: Colors.white,
//                iconSize: 24,
//                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//                duration: Duration(milliseconds: 350),
//                tabBackgroundColor: Colors.grey[800],
//                tabs: [
//                  GButton(
//                    icon: LineAwesomeIcons.home,
//                    text: 'Home',
//                    curve: Curves.decelerate,
//                  ),
//                  GButton(
//                    icon: LineAwesomeIcons.fax,
//                    text: 'Likes',
//                  ),
//                  GButton(
//                    icon: LineAwesomeIcons.search,
//                    text: 'Search',
//                  ),
//                ],
//                selectedIndex: _selectedIndex,
//                onTabChange: (index) {
//                  setState(() {
//                    _selectedIndex = index;
//                  });
//                }),
//          ),
//        ),
//      ),
//    );
//  }
}

class RowSettings with ChangeNotifier, DiagnosticableTreeMixin {
  bool _hasCaption = false;

  bool get hasCaption => _hasCaption;

  void switchHasCaption(bool val) {
    _hasCaption = val;
    notifyListeners();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('hasCaption', hasCaption.toString()));
  }
}
