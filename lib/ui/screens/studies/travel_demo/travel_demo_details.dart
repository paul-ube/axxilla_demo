import 'package:axxilla_demo/ui/widgets/discover_things.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TravelDemoDetails extends StatelessWidget {
  final DiscoverItem discoverItem;
  final String imageAsset;

  const TravelDemoDetails({Key key, this.discoverItem, this.imageAsset})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 350,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    imageAsset,
                    fit: BoxFit.cover,
                  ),
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0, 0.2, 0.95],
                          colors: [
                            Colors.black54,
                            Colors.transparent,
                            Colors.black54,
                          ],
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          padding: const EdgeInsets.all(16.0),

                          child: Text(
                            'The big brown fox jumped over the lazy dog',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1
                                .copyWith(
                                  color: Colors.white,
                                  letterSpacing: 0.2,
                                  fontSize: 16,
                                ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
