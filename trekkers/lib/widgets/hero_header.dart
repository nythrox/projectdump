import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/foundation.dart';

class HeroHeader implements SliverPersistentHeaderDelegate {
  HeroHeader({
    this.minExtent,
    this.maxExtent,
    this.content
  });

  double maxExtent;
  double minExtent;
  Widget content;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    IconData back = Theme.of(context).platform == TargetPlatform.iOS
        ? Icons.arrow_back_ios
        : Icons.arrow_back;

    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: this.content ?? Container(),
        ),
        Positioned(
          left: 4.0,
          top: 4.0,
          child: SafeArea(
            child: IconButton(
              color: Colors.white,
              icon: Icon(back),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ),

      ],
    );
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  FloatingHeaderSnapConfiguration get snapConfiguration => null;

  @override
  // TODO: implement stretchConfiguration
  OverScrollHeaderStretchConfiguration get stretchConfiguration => null;
}
