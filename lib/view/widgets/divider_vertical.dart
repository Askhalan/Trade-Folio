// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:tradefolio/core/utils/constants/colors.dart';

class DividerVertical extends StatelessWidget {
  const DividerVertical({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      height: 35,
      color: JColor.white,
    );
  }
}
