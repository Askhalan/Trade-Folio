// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:tradefolio/core/utils/constants/colors.dart';
import 'package:tradefolio/core/utils/constants/sizes.dart';
import 'package:tradefolio/core/utils/helpers/helper_functions.dart';
import 'package:tradefolio/view/home/widgets/add_button.dart';
import 'package:tradefolio/view/widgets/divider_vertical.dart';

class SearchItemTile extends StatelessWidget {
  const SearchItemTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: JSize.defaultPaddingHalf,
      height: 80,
      width: JHelperFunctions.screenWidth(context),
      decoration: BoxDecoration(
          color: JColor.softGrey.withOpacity(0.3),
          borderRadius: BorderRadius.circular(JSize.borderRadLg * 2.5)),
      child: Row(
        children: [
          Container(
            height: 80,
            width: 73,
            decoration: BoxDecoration(
                color: JColor.grey,
                borderRadius: BorderRadius.circular(JSize.borderRadLg * 2)),
          ),
          Spacer(),
          //-- Company Name
          Text('Apple',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontSize: 20, color: JColor.white)),
          Spacer(),
          DividerVertical(),
          Spacer(),
          //-- Price
          Text('\u20B9 3000',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontSize: 18, color: JColor.white)),
          Spacer(
            flex: 5,
          ),
          AddButton(onPressed: (){},),
        ],
      ),
    );
  }
}
