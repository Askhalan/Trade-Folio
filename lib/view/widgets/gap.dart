import 'package:flutter/material.dart';

class JGap extends StatelessWidget {
  const JGap({super.key, this.h = 12, this.w = 12, this.extra = false,  this.half = false});
  final double h, w;
  final bool extra;
  final bool half;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: extra ? h * 2 : h,
      width: extra ? w * 2 : w,
    );
  }
}
