import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class ReflectlyCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              offset: const Offset(1.7, 1.7),
              blurRadius: 15,
              spreadRadius: -0.5,
            ),
            BoxShadow(
              blurRadius: 10,
              color: Colors.grey.withOpacity(.05),
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: Stack(
              overflow: Overflow.visible,
              children: [
                Positioned(
                    left: -10,
                    top: 0,
                    child: Icon(
                      FeatherIcons.alertCircle,
                      color: Colors.yellow,
                      size: 100,
                    )),
                Column(
                  children: <Widget>[
                    Text(
                      'hee',
                      style: Theme.of(context).textTheme.headline6,
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
