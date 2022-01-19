import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../theme.dart';

class ValueString extends StatelessWidget {
  final String value;
  final String? cmOrKg;
  final double numberSize;
  final double cmOrKgSize;
  const ValueString({
    Key? key,
    required this.value,
    this.cmOrKg,
    required this.numberSize,
    required this.cmOrKgSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoSizeText.rich(
      TextSpan(
        text: value,
        style: whiteTextStyle.copyWith(
          fontSize: numberSize,
          fontWeight: black,
        ),
        children: [
          TextSpan(
            text: cmOrKg == null ? '' : ' $cmOrKg',
            style: whiteTextStyle.copyWith(
              color: greyColor,
              fontSize: cmOrKgSize,
              fontWeight: semiBold,
            ),
          ),
        ],
      ),
      maxLines: 1,
    );
  }
}
