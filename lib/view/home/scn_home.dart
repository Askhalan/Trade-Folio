// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tradefolio/controller/ui_controller.dart';
import 'package:tradefolio/core/utils/constants/sizes.dart';
import 'package:tradefolio/core/utils/helpers/helper_functions.dart';
import 'package:tradefolio/view/home/widgets/search_item_tile.dart';
import 'package:tradefolio/view/widgets/appbar.dart';
import 'package:tradefolio/view/widgets/gap.dart';

class ScnHome extends StatelessWidget {
  const ScnHome({super.key});

  @override
  Widget build(BuildContext context) {
    final UiController uiController = Get.put(UiController());
    return Scaffold(
      appBar: JAppBar(),
      body: Padding(
        padding: JSize.defaultInnerPadding,
        child: Column(
          children: [
            // Search bar and rest of the UI
            Obx(
              () => AnimatedSwitcher(
                duration: Duration(milliseconds: 800),
                child: uiController.searchEnabled.value
                    ? SizedBox(
                        height: JHelperFunctions.screenHeight(context) * 0.4,
                        child: AnimatedOpacity(
                          opacity: uiController.searchEnabled.value ? 1.0 : 0.0,
                          duration: Duration(milliseconds: 1200),
                          child: ListView.separated(
                            itemCount: 5,
                            itemBuilder: (BuildContext context, int index) {
                              return SearchItemTile();
                            },
                            separatorBuilder: (context, index) => JGap(h: 15),
                          ),
                        ),
                      )
                    : Container(), // Empty container when search is not enabled
              ),
            )
          ],
        ),
      ),
    );
  }
}
