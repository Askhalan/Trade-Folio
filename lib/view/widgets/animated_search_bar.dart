import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:tradefolio/controller/search_controller.dart';
import 'package:tradefolio/controller/ui_controller.dart';
import 'package:tradefolio/core/utils/constants/colors.dart';
import 'package:tradefolio/core/utils/constants/sizes.dart';
import 'package:tradefolio/core/utils/helpers/helper_functions.dart';

class AnimatedSearchBar extends StatelessWidget {
  const AnimatedSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final UiController uiController = Get.find();
    final HomeController homeController = Get.find();
    return Obx(
      () => AnimatedContainer(
          height: 50,
          width: uiController.searchEnabled.value
              ? JHelperFunctions.screenWidth(context) * 0.9
              : 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
            uiController.searchEnabled.value
                ? JSize.inputFieldRadiusXl
                : JSize.appbarBorderRad,
          )),
          duration: const Duration(milliseconds: 500),
          child: uiController.searchEnabled.value
              ? Row(
                  children: [
                    const Spacer(flex: 1),
                    Flexible(
                      flex: 20,
                      child: TextFormField(
                        decoration: InputDecoration(
                            suffix: homeController.isLoading.value
                                ? const SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator())
                                : const SizedBox()),
                        onChanged: (value) {
                          homeController.onSearchChanged(value);
                        },
                      ),
                    ),
                    const Spacer(flex: 1),
                    Container(
                      decoration: BoxDecoration(
                          color: JColor.white,
                          borderRadius:
                              BorderRadius.circular(JSize.inputFieldRadiusXl)),
                      child: IconButton(
                          onPressed: () {
                            uiController.searchEnabled.value =
                                !uiController.searchEnabled.value;
                          },
                          icon: const Icon(Icons.close)),
                    ),
                    const Spacer(flex: 1)
                  ],
                )
              : Container(
                  decoration: BoxDecoration(
                      color: JColor.white,
                      borderRadius:
                          BorderRadius.circular(JSize.inputFieldRadiusXl)),
                  child: IconButton(
                      onPressed: () {
                        uiController.searchEnabled.value =
                            !uiController.searchEnabled.value;
                        homeController.searchResults.clear();
                      },
                      icon: const Icon(Icons.search)),
                )),
    );
  }
}
