// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tradefolio/controller/watchlist_controller.dart';
import 'package:tradefolio/core/utils/constants/colors.dart';
import 'package:tradefolio/core/utils/constants/sizes.dart';
import 'package:tradefolio/core/utils/helpers/helper_functions.dart';
import 'package:tradefolio/model/company_model.dart';
import 'package:tradefolio/view/widgets/gap.dart';

class WatchListTile extends StatelessWidget {
  const WatchListTile({
    super.key,
    required this.company,
  });

  final CompanyModel company;

  @override
  Widget build(BuildContext context) {
    final WatchlistController watchlistController = Get.find();
    watchlistController.syncStockPriceIfNeeded(company);
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
                          company.symbol,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(fontSize: 16, color: JColor.white),
                        ),
                        SizedBox(
                          width: JHelperFunctions.screenWidth(context) * 0.3,
                          child: Text(
                            company.name,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .copyWith(color: JColor.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                JGap(
                  extra: true,
                ),
                Text(company.quote?.price ?? '',
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
              child: IconButton(
                  onPressed: () {
                    watchlistController.deleteCompanyFromWatchlist(company);
                  },
                  icon: Icon(Iconsax.trash4)),
            ),
          )
        ],
      ),
    );
  }
}
