import 'dart:math';

import 'package:flutter/material.dart';

class DiscoverItemModel {
  final String title;
  final String cost, time, location, type;
  final IconData typeIcon;
  double _rating;
  int reviewCount;

  DiscoverItemModel({
    this.title,
    this.cost,
    this.time,
    this.location,
    this.type,
    this.typeIcon,
  })  : reviewCount = Random().nextInt(2500),
        _rating = Random().nextInt(5).toDouble();

  double get rating => _rating == 0 ? 1.5 : _rating;
}
