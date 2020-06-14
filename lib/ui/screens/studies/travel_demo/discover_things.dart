import 'dart:math';

import 'package:axxilla_demo/core/constants/app_colors.dart';

import 'package:axxilla_demo/ui/widgets/animations/open_container_animation/open_container_wrapper.dart';
import 'package:axxilla_demo/ui/widgets/components/category_title.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import '../../../widgets/icon_plus_name.dart';
import 'model/discover_item.dart';
import 'travel_demo_details.dart';

final List<DiscoverItemModel> _discoverList = <DiscoverItemModel>[
  DiscoverItemModel(
    title: 'Authentic Vietnamese Dinner',
    cost: '\$290 per person',
    time: '90 minutes',
    location: '0.1 km away',
    type: 'Accepts crypto',
    typeIcon: MdiIcons.bitcoin,
  ),
  DiscoverItemModel(
    title: 'Learn to surf at Venice Beach',
    cost: '\$56 per person',
    time: '2 hours',
    location: 'Los Angeles',
    type: 'Good for groups',
    typeIcon: Icons.group,
  ),
  DiscoverItemModel(
    title: 'Concerts at the Cedar Cultural Center',
    cost: '\$517 per person',
    time: '93 minutes',
    location: 'Metropolitan',
    type: 'Good for groups',
    typeIcon: Icons.group,
  ),
  DiscoverItemModel(
    title: 'Safari across Namibia Wildlife Preserve',
    cost: '\$449 per person',
    time: '3 hours',
    location: 'Namibia',
    type: 'Outdoors',
    typeIcon: MdiIcons.pineTree,
  ),
  DiscoverItemModel(
    title: 'Photography Course for Beginners',
    cost: '\$57 per person',
    time: '120 minutes',
    location: '13 mins away',
    type: 'Good for groups',
    typeIcon: Icons.group,
  ),
  DiscoverItemModel(
    title: 'Kyoto Landmark Sightseeing Tour',
    cost: '\$29 per person',
    time: '4 hours',
    location: 'Kyoto Japan',
    type: 'Outdoors',
    typeIcon: MdiIcons.pineTree,
  ),
];

class DiscoverThings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        CategoryTitle(title: 'Discover Things to do'),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 8, 0, 4),
          child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              itemCount: _discoverList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio:
                    MediaQuery.of(context).orientation == Orientation.landscape
                        ? 0.9
                        : 0.72,
              ),
              itemBuilder: (BuildContext context, int index) {
                int _index = index + 1;
                if (_index > 8) _index = 1;
                String _imageAsset = 'assets/landscape-$_index.png';
                DiscoverItemModel _item = _discoverList[index];

                return OpenContainerWrapper(
                    destination: TravelDemoDetails(
                      discoverItem: _item,
                      imageAsset: _imageAsset,
                    ),
                    closedColor: Colors.white,
                    closedBuilder:
                        (BuildContext _, VoidCallback openContainer) {
                      return _DiscoverWidget(
                        imageAsset: _imageAsset,
                        item: _item,
                        reviewCount: _item.reviewCount,
                        rating: _item.rating,
                        openContainer: openContainer,
                      );
                    });
              }),
        )
      ],
    );
  }
}

class _DiscoverWidget extends StatelessWidget {
  const _DiscoverWidget({
    Key key,
    @required DiscoverItemModel item,
    @required String imageAsset,
    @required VoidCallback openContainer,
    this.rating,
    this.reviewCount,
  })  : _item = item,
        _imageAsset = imageAsset,
        _openContainer = openContainer,
        super(key: key);

  final DiscoverItemModel _item;
  final String _imageAsset;
  final VoidCallback _openContainer;
  final double rating;
  final int reviewCount;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _openContainer,
      child: Ink(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: AspectRatio(
                  aspectRatio: 16 / 11,
                  child: Image.asset(
                    _imageAsset,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
                child: Text(
                  _item.title,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      .copyWith(fontWeight: FontWeight.w700),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    const SizedBox(height: 2),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Expanded(
                            child: IconPlusName(
                              icon: Icons.monetization_on,
                              name: _item.cost,
                            ),
                          ),
                          Expanded(
                            child: IconPlusName(
                              icon: Icons.access_time,
                              name: _item.time,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Expanded(
                            child: IconPlusName(
                              icon: Icons.location_on,
                              name: _item.location,
                            ),
                          ),
                          Expanded(
                            child: IconPlusName(
                              icon: _item.typeIcon,
                              name: _item.type,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 2),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: SmoothStarRating(
                            rating: rating,
                            isReadOnly: true,
                            size: 16,
                            filledIconData: Icons.star,
                            halfFilledIconData: Icons.star_half,
                            defaultIconData: Icons.star_border,
                            color: orangeAccent,
                            borderColor: orangeAccent,
                            starCount: 5,
                            allowHalfRating: true,
                            spacing: 2.0,
                            onRated: (value) {},
                          ),
                        ),
                        Flexible(
                          child: Text(
                            '$reviewCount Reviews',
                            style: Theme.of(context).textTheme.caption.apply(
                                  color: Colors.black54,
                                  fontWeightDelta: 3,
                                ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

