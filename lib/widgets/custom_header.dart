import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../theme.dart';

class CustomHeader extends StatelessWidget {
  final String title;
  final double customWidth;
  final double customHeight;
  final dynamic customBorderRadius;
  final dynamic group;

  const CustomHeader({
    Key? key,
    required this.title,
    required this.customWidth,
    required this.customHeight,
    required this.customBorderRadius,
    this.group,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: customWidth,
      height: customHeight,
      decoration: BoxDecoration(
        color: secondColor,
        borderRadius: customBorderRadius,
      ),
      child: Center(
        child: AutoSizeText(
          title,
          style: whiteTextStyle.copyWith(
            fontSize: 24,
            fontWeight: semiBold,
            letterSpacing: 1,
          ),
          group: group,
          maxLines: 1,
        ),
      ),
    );
  }
}
