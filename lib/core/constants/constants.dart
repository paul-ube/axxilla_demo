import 'dart:core';

import 'package:flutter/material.dart';

var kBackgroundColor = Color(0xffF9F9F9);
var kWhiteColor = Color(0xffffffff);
const double kBorderRadius = 7;

BoxDecoration get kOverlayDecoration => BoxDecoration(
      borderRadius: BorderRadius.circular(kBorderRadius),
      gradient: LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
        stops: [
          0,
          0.3,
        ],
        colors: [
          Colors.black87,
          Colors.transparent,
        ],
      ),
    );

BoxDecoration get kNoBoxDecoration => BoxDecoration(
      borderRadius: BorderRadius.circular(kBorderRadius),
    );


BoxDecoration get kCardDecoration => BoxDecoration(
  boxShadow: [
    BoxShadow(
      color: Colors.grey.withOpacity(0.25),
      offset: const Offset(1.7, 1.7),
      blurRadius: 6,
      spreadRadius: -0.5,
    ),
    BoxShadow(
      blurRadius: 10,
      color: Colors.grey.withOpacity(.1),
      offset: Offset(2, 2),
    ),
  ],
);

const kLoremIpsum = "Lorem ipsum dolor sit amet, consectetur"
    " adipiscing elit, sed do eiusmod tempor incididunt ut labore"
    " et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud"
    " exercitation ullamco laboris nisi ut aliquip ex ea commodo"
    " consequat. Duis aute irure dolor in reprehenderit in voluptate"
    " velit esse cillum dolore eu fugiat nulla pariatur. Excepteur"
    " sint occaecat cupidatat non proident, sunt in culpa qui officia"
    " deserunt mollit anim id est laborum.";

const List<String> kLandscapeImagesString = <String>[
  'assets/landscape-1.png',
  'assets/landscape-2.png',
  'assets/landscape-3.png',
  'assets/landscape-4.png',
  'assets/landscape-5.png',
  'assets/landscape-6.png',
  'assets/landscape-7.png',
  'assets/landscape-8.png',
];

const List<String> kPortraitImagesString = <String>[
  'assets/portrait-1.png',
  'assets/portrait-2.png',
  'assets/portrait-3.png',
  'assets/portrait-4.png',
  'assets/portrait-5.png',
  'assets/portrait-6.png',
  'assets/portrait-7.png',
  'assets/portrait-8.png',
  'assets/portrait-9.png',
];

const List<String> kAllImagesString = <String>[
  ...kLandscapeImagesString, ...kPortraitImagesString
];


