import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tradefolio/core/utils/constants/colors.dart';
import 'package:tradefolio/core/utils/constants/sizes.dart';
import 'package:tradefolio/core/utils/helpers/helper_functions.dart';

class JMessages {
  static customToast({required message}) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
        elevation: 0,
        duration: const Duration(seconds: 3),
        backgroundColor: JColor.transperent,
        content: Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
              color: JHelperFunctions.isDarkMode(Get.context!)
                  ? JColor.darkerGrey.withOpacity(0.9)
                  : JColor.grey.withOpacity(0.9),
              borderRadius: BorderRadius.circular(JSize.borderRadMd)),
          child: Text(
            message,
            style: Theme.of(Get.context!).textTheme.labelLarge,
          ),
        )));
  }

  static snackbarSuccess({required title, message = ''}) {
    Get.snackbar(title, message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: JColor.white,
        backgroundColor: JColor.success,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
        margin: const EdgeInsets.all(20),
        icon: const Icon(
          Icons.done_all,
          color: JColor.white,
        ));
  }

  static snackbarWarning({required title, message = ''}) {
    Get.snackbar(title, message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: JColor.white,
        backgroundColor: JColor.warning,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
        margin: const EdgeInsets.all(20),
        icon: const Icon(
          Icons.warning_amber_outlined,
          color: JColor.white,
        ));
  }

  static snackbarerror({required title, message = ''}) {
    Get.snackbar(title, message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: JColor.white,
        backgroundColor: JColor.error,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
        margin: const EdgeInsets.all(20),
        icon: const Icon(
          Icons.error_outline,
          color: JColor.white,
        ));
  }
}
