import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class OpenContainerWrapper extends StatelessWidget {
  const OpenContainerWrapper({
    this.closedBuilder,
    this.transitionType = ContainerTransitionType.fade,
//    this.onClosed,
    this.destination, this.closedColor = Colors.transparent,
  });

  final OpenContainerBuilder closedBuilder;
  final ContainerTransitionType transitionType;
//  final ClosedCallback<bool> onClosed;
  final Widget destination;
  final Color closedColor;

  @override
  Widget build(BuildContext context) {
    return OpenContainer<bool>(
     closedElevation: 0,
      closedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,

      ),
      closedColor: closedColor,
      transitionType: transitionType,
      openBuilder: (BuildContext context, VoidCallback _) {
        return destination;
      },
//      onClosed: onClosed,
      tappable: false,
      closedBuilder: closedBuilder,
    );
  }
}

class InkWellOverlay extends StatelessWidget {
  const InkWellOverlay({
    this.openContainer,
    this.width,
    this.height,
    this.child,
  });

  final VoidCallback openContainer;
  final double width;
  final double height;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: InkWell(
        onTap: openContainer,
        child: child,
      ),
    );
  }
}