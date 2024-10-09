// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tradefolio/controller/watchlist_controller.dart';
import 'package:tradefolio/core/utils/constants/colors.dart';
import 'package:tradefolio/core/utils/constants/sizes.dart';
import 'package:tradefolio/view/widgets/appbar.dart';
import 'package:tradefolio/view/widgets/gap.dart';
import 'package:tradefolio/view/watchlist/widgets/watch_list_tile.dart';

class WatchList extends StatelessWidget {
  WatchList({super.key});

  @override
  Widget build(BuildContext context) {
    final WatchlistController watchlistController = Get.find();
    watchlistController.fetchWatchlist();
    return Scaffold(
        appBar: JAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Watch List',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: 18, color: JColor.white))
            ],
          ),
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: JSize.defaultPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Your Stocks',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: 18, color: JColor.white)),
              JGap(),
              Obx(() {
                if (watchlistController.watchItemsList.isNotEmpty) {
                  return GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: JSize.defaultPaddingValue,
                            crossAxisSpacing: JSize.defaultPaddingValue,
                            childAspectRatio: 6 / 3.5),
                    itemCount: watchlistController.watchItemsList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return WatchListTile(
                        company: watchlistController.watchItemsList[index],
                      );
                    },
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.only(top: 200),
                    child: Center(
                      child: Text(
                        'Add stocks to watchlist',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontSize: 18, color: JColor.white),
                      ),
                    ),
                  );
                }
              })
            ],
          ),
        )));
  }
}
