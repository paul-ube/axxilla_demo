import 'package:axxilla_demo/core/constants/app_colors.dart';
import 'package:axxilla_demo/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../fade_in_image_placeholder.dart';

class StudiesCard extends StatelessWidget {
  final String destination;
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
            if (assetImage != null)
              FadeInImagePlaceholder(
                image: AssetImage(assetImage),
                child: Ink.image(
                  image: AssetImage(assetImage),
                  fit: BoxFit.cover,
                ),
                placeholder: Container(
                  color: Colors.blue,
                ),
              ),
//            ClipRRect(
//              borderRadius: BorderRadius.circular(kBorderRadius),
//              child: Image.asset(
//                assetImage,
//                fit: BoxFit.cover,
//              ),
//            ),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    stops: [0, 0.8,1],
                    colors: [
                      color,
                      color.withOpacity(0.55),
                      color.withOpacity(0),
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
                  onTap: () async {
                    Navigator.of(context).pushNamed(destination);
//                    Timer(Duration(milliseconds: 500), () {
//                      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
//                    });
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

/// Wrap the studies with this to display a back button and allow the user to
/// exit them at any time.
class StudyWrapper extends StatefulWidget {
  const StudyWrapper({
    Key key,
    this.study,
  }) : super(key: key);

  final Widget study;

  @override
  _StudyWrapperState createState() => _StudyWrapperState();
}

class _StudyWrapperState extends State<StudyWrapper> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Stack(
      children: [
        Semantics(
//          sortKey: const OrdinalSortKey(1),
          child: widget.study,
        ),
        Align(
          alignment: AlignmentDirectional.bottomStart,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Semantics(
//              sortKey: const OrdinalSortKey(0),
              label: 'Back',
              button: true,
              excludeSemantics: true,
              child: FloatingActionButton.extended(
                backgroundColor: axxillaBG,
                key: const ValueKey('Back'),
                onPressed: () {
                  Navigator.of(context)
                      .popUntil((route) => route.settings.name == '/');
                },
                icon: IconTheme(
                  data: IconThemeData(color: colorScheme.onPrimary),
                  child: const BackButtonIcon(),
                ),
                label: Text(
                  MaterialLocalizations.of(context).backButtonTooltip,
//                  style: textTheme.button.apply(color: colorScheme.onPrimary),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
