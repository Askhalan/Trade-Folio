// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:tradefolio/core/utils/constants/colors.dart';
import 'package:tradefolio/core/utils/constants/sizes.dart';

class AddButton extends StatelessWidget {
  const AddButton({
    super.key, this.onPressed,
  });
final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 73,
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: JColor.grey),
          borderRadius: BorderRadius.circular(JSize.borderRadLg * 2)),
      child: IconButton(
          onPressed: onPressed,
          icon: Icon(
            Icons.add,
            color: JColor.accent,
          )),
    );
  }
}
