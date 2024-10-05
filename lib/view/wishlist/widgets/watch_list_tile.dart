// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tradefolio/core/utils/constants/colors.dart';
import 'package:tradefolio/core/utils/constants/sizes.dart';
import 'package:tradefolio/view/widgets/gap.dart';

class WatchListTile extends StatelessWidget {
  const WatchListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
      child: Stack(
        children: [
          Container(
            padding: JSize.defaultPadding,
            decoration: BoxDecoration(
                color: JColor.darkGrey.withOpacity(0.5),
                borderRadius: BorderRadius.circular(JSize.borderRadLg * 2)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(),
                    JGap(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Nike',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(fontSize: 16, color: JColor.white),
                        ),
                        Text(
                          'Nike, Inc',
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall!
                              .copyWith(color: JColor.white),
                        ),
                      ],
                    ),
                  ],
                ),
                JGap(
                  extra: true,
                ),
                Text('90,26',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontSize: 18, color: JColor.white))
              ],
            ),
          ),
          Positioned(
            bottom: 15,
            right: 15,
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: JColor.error.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(JSize.borderRadLg)),
              child: IconButton(onPressed: () {}, icon: Icon(Iconsax.trash4)),
            ),
          )
        ],
      ),
    );
  }
}
