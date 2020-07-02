import 'package:axxilla_demo/ui/screens/studies/overdrop_clone/overdrop_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SliverStatusBar extends StatefulWidget {
  final Widget child;

  const SliverStatusBar({Key key, @required this.child}) : super(key: key);

  @override
  _SliverStatusBarState createState() => _SliverStatusBarState();
}

class _SliverStatusBarState extends State<SliverStatusBar> {
  ScrollPosition _position;
  bool _visible;

  @override
  void dispose() {
    _removeListener();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _removeListener();
    _addListener();
  }

  void _addListener() {
    _position = Scrollable.of(context)?.position;
    _position?.addListener(_positionListener);
    _positionListener();
  }

  void _removeListener() {
    _position?.removeListener(_positionListener);
  }

  void _positionListener() {
    final FlexibleSpaceBarSettings settings =
        context.dependOnInheritedWidgetOfExactType();
    bool visible =
        settings == null || settings.currentExtent <= settings.minExtent;
    if (_visible != visible) {
      setState(() {
        _visible = visible;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
        systemNavigationBarColor: OverDropColors.background,
        statusBarBrightness: _visible ? Brightness.light : Brightness.dark,
        statusBarColor:
            _visible ? Colors.transparent : OverDropColors.background,
      ),
      child: widget.child,
    );
  }
}
