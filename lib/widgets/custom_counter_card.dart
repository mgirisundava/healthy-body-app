// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../theme.dart';
import 'counter_button.dart';

class CustomCounterCard extends StatelessWidget {
  final String title;
  final String value;
  final String subTitle;
  final VoidCallback onDecrement;
  final VoidCallback onIncrement;
  const CustomCounterCard({
    Key? key,
    required this.title,
    required this.value,
    required this.subTitle,
    required this.onDecrement,
    required this.onIncrement,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    num screenHeight = MediaQuery.of(context).size.height;

    return Container(
      margin: const EdgeInsets.fromLTRB(10, 10, 0, 10),
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 3,
                  color: thirdColor,
                ),
                color: secondColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: FittedBox(
                child: screenHeight > 600
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          AutoSizeText(
                            title,
                            style: greyTextStyle.copyWith(
                              fontSize: 18,
                              fontWeight: semiBold,
                              letterSpacing: 1,
                            ),
                            maxLines: 1,
                          ),
                          AutoSizeText(
                            value,
                            style: whiteTextStyle.copyWith(
                              fontSize: 50,
                              fontWeight: black,
                            ),
                            maxLines: 1,
                          ),
                          AutoSizeText(
                            subTitle,
                            style: greyTextStyle.copyWith(
                              fontSize: 18,
                              fontWeight: semiBold,
                              letterSpacing: 1,
                            ),
                            maxLines: 1,
                          ),
                        ],
                      )
                    : AutoSizeText.rich(
                        TextSpan(
                            text: value,
                            style: whiteTextStyle.copyWith(
                              fontSize: 40,
                              fontWeight: black,
                            ),
                            children: [
                              TextSpan(
                                text: ' ${subTitle}',
                                style: whiteTextStyle.copyWith(
                                  color: greyColor,
                                  fontSize: 18,
                                  fontWeight: semiBold,
                                  letterSpacing: 1,
                                ),
                              ),
                            ]),
                      ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CounterButton(
                    onPressed: onDecrement,
                    icon: const FaIcon(FontAwesomeIcons.minus),
                  ),
                  CounterButton(
                    onPressed: onIncrement,
                    icon: const FaIcon(FontAwesomeIcons.plus),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
