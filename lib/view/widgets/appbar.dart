// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:tradefolio/controller/ui_controller.dart';
import 'package:tradefolio/core/utils/constants/colors.dart';
import 'package:tradefolio/core/utils/constants/sizes.dart';
import 'package:tradefolio/core/utils/devices/device_utility.dart';
import 'package:tradefolio/view/widgets/animated_search_bar.dart';

class JAppBar extends StatelessWidget implements PreferredSizeWidget {
  const JAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(UiController());
    return Padding(
      padding: JSize.defaultPadding,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: JSize.defaultInnerPadding,
          height: 200,
          decoration: BoxDecoration(
              gradient: JColor.primaryGradient,
              borderRadius: BorderRadius.circular(JSize.borderRadLg * 5)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AnimatedSearchBar(
                widget: TextFormField(
                  decoration: InputDecoration(
                    suffix:
                        IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(JDeviceUtil.getAppBarHeight() * 3);
}
