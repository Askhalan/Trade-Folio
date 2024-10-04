// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:tradefolio/controller/ui_controller.dart';
import 'package:tradefolio/core/utils/constants/colors.dart';
import 'package:tradefolio/core/utils/constants/sizes.dart';
import 'package:tradefolio/core/utils/devices/device_utility.dart';

class JAppBar extends StatelessWidget implements PreferredSizeWidget {
  const JAppBar({super.key, required this.child});

  final Widget child;
  @override
  Widget build(BuildContext context) {
    Get.put(UiController());
    return Padding(
      padding: JSize.defaultPadding,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
        child: Container(
            padding: JSize.defaultInnerPadding,
            height: 220,
            decoration: BoxDecoration(
                gradient: JColor.primaryGradient,
                borderRadius: BorderRadius.circular(JSize.borderRadLg * 5)),
            child: child),
      ),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(JDeviceUtil.getAppBarHeight() * 2.5);
}
