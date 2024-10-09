// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:tradefolio/controller/watchlist_controller.dart';
import 'package:tradefolio/core/utils/constants/colors.dart';
import 'package:tradefolio/core/utils/constants/sizes.dart';
import 'package:tradefolio/core/utils/helpers/helper_functions.dart';
import 'package:tradefolio/model/company_with_quote_model.dart';
import 'package:tradefolio/view/home/widgets/add_button.dart';
import 'package:tradefolio/view/widgets/divider_vertical.dart';

class SearchItemTile extends StatelessWidget {
  const SearchItemTile({
    super.key,
    required this.data,
  });

  final CompanyWithQuoteModel data;
  @override
  Widget build(BuildContext context) {
    final WatchlistController watchlistController = Get.find();
    return Container(
      padding: JSize.defaultPadding,
      height: 80,
      width: JHelperFunctions.screenWidth(context),
      decoration: BoxDecoration(
          color: JColor.softGrey.withOpacity(0.3),
          borderRadius: BorderRadius.circular(JSize.borderRadLg * 2.5)),
      child: Row(
        children: [
          //-- Company Name
          SizedBox(
            width: JHelperFunctions.screenWidth(context) * 0.4,
            child: Text(data.name,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontSize: 20, color: JColor.white)),
          ),
          Spacer(),
          DividerVertical(),
          Spacer(),
          //-- Price
          Text('\u20B9 ${data.price}',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontSize: 18, color: JColor.white)),
          Spacer(
            flex: 5,
          ),
          AddButton(
            onPressed: () {
              watchlistController.addToWatchlist(data);
            },
          ),
        ],
      ),
    );
  }
}
