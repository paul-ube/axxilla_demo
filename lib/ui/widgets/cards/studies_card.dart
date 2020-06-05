import 'package:axxilla_demo/core/constants/constants.dart';
import 'package:axxilla_demo/ui/screens/studies/travel_demo/travel_demo_screen.dart';
import 'package:flutter/material.dart';

class StudiesCard extends StatelessWidget {
  final Widget destination;
  final String title;
  final String subtitle;
  final String assetImage;
  final Color color;
  final Color textColor;

  const StudiesCard({
    Key key,
    @required this.destination,
    @required this.title,
    this.subtitle,
    this.assetImage,
    this.color = Colors.black,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    double _maxWidth = MediaQuery.of(context).size.width;
    if (orientation == Orientation.landscape) {
      _maxWidth = 600;
    }

    return Container(
      decoration: kCardDecoration.copyWith(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(kBorderRadius),
      ),
      height: 150,
      margin: const EdgeInsets.fromLTRB(16, 12, 16, 4),
      child: Material(
        type: MaterialType.transparency,
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.circular(kBorderRadius),
        elevation: 0,
        child: Stack(
          alignment: Alignment.topLeft,
          fit: StackFit.expand,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(kBorderRadius),
              child: Image.asset(
                assetImage,
                fit: BoxFit.cover,
              ),
            ),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    stops: [0, 0.67, 1.0],
                    colors: [
                      color,
                      color.withOpacity(0.54),
                      Colors.transparent,
                    ],
                  ),
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    constraints: BoxConstraints(
                      maxWidth: _maxWidth / 1.8,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Flexible(
                          child: Text(
                            title ?? '',
                            style:
                                Theme.of(context).textTheme.headline6.copyWith(
                                      color: textColor,
                                    ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(height: 4),
                        subtitle == null
                            ? const SizedBox.shrink()
                            : Flexible(
                                child: Text(
                                  subtitle,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle2
                                      .copyWith(
                                        color: textColor.withOpacity(0.7),
                                        fontWeight: FontWeight.w400,
                                      ),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: Material(
                type: MaterialType.transparency,
                child: InkWell(
                  borderRadius: BorderRadius.circular(kBorderRadius),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TravelDemoScreen()),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
