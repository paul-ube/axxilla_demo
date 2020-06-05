import 'package:axxilla_demo/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CategoryTitle extends StatelessWidget {
  final String title;

  const CategoryTitle({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        title ?? '',
        style: Theme.of(context).textTheme.headline5.copyWith(
          color: primaryBlue,
          fontWeight: FontWeight.bold,
          letterSpacing: 0,
        ),
      ),
    );
  }
}