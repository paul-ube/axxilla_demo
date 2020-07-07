import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DefaultAnnotatedRegion extends StatelessWidget {
  final Widget child;

  const DefaultAnnotatedRegion({Key key, @required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarDividerColor: null,
      ),
      child: child,
    );
  }
}
