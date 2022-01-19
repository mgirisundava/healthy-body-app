import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../theme.dart';

class AboutBottomSheet extends StatelessWidget {
  final String description;
  const AboutBottomSheet({
    Key? key,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: mainColor,
        child: Wrap(
          children: [
            Container(
              decoration: BoxDecoration(
                color: secondColor,
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(15),
              width: double.infinity,
              child: AutoSizeText(
                'ABOUT',
                style: whiteTextStyle.copyWith(
                    fontSize: 18, fontWeight: bold, letterSpacing: 1),
                textAlign: TextAlign.center,
                maxLines: 1,
              ),
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: secondColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: AutoSizeText(
                description,
                style: greyTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: normal,
                  height: 1.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
