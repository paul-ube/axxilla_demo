import 'dart:math';

import 'package:axxilla_demo/core/constants/constants.dart';
import 'package:flutter/material.dart';

class SquareImage extends StatefulWidget {
  final double height;
  final BorderRadius borderRadius;
  final EdgeInsets padding;

  const SquareImage({
    Key key,
    this.height,
    this.borderRadius,
    this.padding,
  }) : super(key: key);

  @override
  _SquareImageState createState() => _SquareImageState();
}

class _SquareImageState extends State<SquareImage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: widget.padding ?? const EdgeInsets.only(left: 8.0),
      child: ClipRRect(
        borderRadius: widget.borderRadius ?? BorderRadius.circular(7),
        child: Image.asset(
          kPortraitImagesString[Random().nextInt(kPortraitImagesString.length)],
          fit: BoxFit.cover,
          height: widget.height,
          width: widget.height,
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
