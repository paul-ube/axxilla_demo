import 'dart:math';

import 'package:axxilla_demo/core/constants/constants.dart';
import 'package:flutter/material.dart';

class SquareImage extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.only(left: 8.0),
      child: ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.circular(7),
        child: Image.asset(
          kPortraitImagesString[Random().nextInt(kPortraitImagesString.length)],
          fit: BoxFit.cover,
          height: height,
          width: height,
        ),
      ),
    );
  }
}
