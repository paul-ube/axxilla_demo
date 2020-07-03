import 'package:axxilla_demo/route_paths.dart';
import 'package:axxilla_demo/ui/screens/studies/overdrop_clone/weather_screen.dart';
import 'package:axxilla_demo/ui/screens/studies/travel_demo/travel_demo_screen.dart';
import 'package:axxilla_demo/ui/screens/studies_screen.dart';
import 'package:axxilla_demo/ui/widgets/cards/studies_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'ui/screens/studies/google_discover_clone/discover_clone_screen.dart';

typedef PathWidgetBuilder = Widget Function(BuildContext, String);

class Path {
  const Path(this.pattern, this.builder);

  /// A RegEx string for route matching.
  final String pattern;

  /// The builder for the associated pattern route. The first argument is the
  /// [BuildContext] and the second argument a RegEx match if that is included
  /// in the pattern.
  ///
  /// ```dart
  /// Path(
  ///   'r'^/demo/([\w-]+)$',
  ///   (context, matches) => Page(argument: match),
  /// )
  /// ```
  final PathWidgetBuilder builder;
}

class RouteConfiguration {
  /// List of [Path] to for route matching. When a named route is pushed with
  /// [Navigator.pushNamed], the route name is matched with the [Path.pattern]
  /// in the list below. As soon as there is a match, the associated builder
  /// will be returned. This means that the paths higher up in the list will
  /// take priority.
  static List<Path> paths = [
//    Path(
//      r'^' + DemoPage.baseRoute + r'/([\w-]+)$',
//          (context, match) => DemoPage(slug: match),
//    ),
//    Path(
//      r'^' + RallyApp.homeRoute,
//          (context, match) => const StudyWrapper(study: RallyApp()),
//    ),
//    Path(
//      r'^' + ShrineApp.homeRoute,
//          (context, match) => const StudyWrapper(study: ShrineApp()),
//    ),
    Path(
      r'^' + RoutePaths.weather,
          (context, match) => const StudyWrapper(study: WeatherScreen()),
    ),
    Path(
      r'^' + RoutePaths.discover,
          (context, match) => const StudyWrapper(study: GoogleDiscoverClone()),
    ),
    Path(
      r'^' + RoutePaths.travel,
          (context, match) => const StudyWrapper(study: TravelDemoScreen()),
    ),
    Path(
      r'^/',
          (context, match) => const StudiesScreen(),
    ),
  ];

  /// The route generator callback used when the app is navigated to a named
  /// route. Set it on the [MaterialApp.onGenerateRoute] or
  /// [WidgetsApp.onGenerateRoute] to make use of the [paths] for route
  /// matching.
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    for (final path in paths) {
      final regExpPattern = RegExp(path.pattern);
      if (regExpPattern.hasMatch(settings.name)) {
        final firstMatch = regExpPattern.firstMatch(settings.name);
        final match = (firstMatch.groupCount == 1) ? firstMatch.group(1) : null;
        if (kIsWeb) {
          return NoAnimationMaterialPageRoute<void>(
            builder: (context) => path.builder(context, match),
            settings: settings,
          );
        }
        return MaterialPageRoute<void>(
          builder: (context) => path.builder(context, match),
          settings: settings,
        );
      }
    }

    // If no match was found, we let [WidgetsApp.onUnknownRoute] handle it.
    return null;
  }
}

class NoAnimationMaterialPageRoute<T> extends MaterialPageRoute<T> {
  NoAnimationMaterialPageRoute({
    @required WidgetBuilder builder,
    RouteSettings settings,
  }) : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child,
      ) {
    return child;
  }
}