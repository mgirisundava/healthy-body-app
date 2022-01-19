import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:healthy_body_app/providers/broca_provider.dart';
import 'package:healthy_body_app/theme.dart';
import 'package:healthy_body_app/widgets/custom_card.dart';
import 'package:healthy_body_app/widgets/custom_header.dart';
import 'package:healthy_body_app/widgets/value_string.dart';
import 'package:provider/provider.dart';

class BrocaResultPage extends StatelessWidget {
  const BrocaResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final group1 = AutoSizeGroup();
    final broca = Provider.of<BrocaProvider>(context);

    Widget backgroundColor() {
      return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: mainGradient,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
      );
    }

    Widget body() {
      return Column(
        children: [
// ignore: todo
// TODO : HEADER SECTION

          Padding(
            padding: const EdgeInsets.only(left: 10, top: 0, right: 10),
            child: CustomHeader(
              title: 'YOUR RESULT',
              customWidth: double.infinity,
              customHeight: 60,
              customBorderRadius: BorderRadius.circular(10),
            ),
          ),

// ignore: todo
// TODO : RESULT BODY

          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
              child: CustomCard(
                child: Container(
                  padding: const EdgeInsets.all(50),
                  width: double.infinity,
                  height: double.infinity,
                  child: FittedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AutoSizeText(
                          'HEALTHY WEIGHT',
                          style: whiteTextStyle.copyWith(
                            color: greenColor,
                            fontSize: 18,
                            fontWeight: black,
                            letterSpacing: 1,
                          ),
                          maxLines: 1,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ValueString(
                          value:
                              broca.calculateBroca(broca.isMale, broca.height),
                          cmOrKg: 'kg',
                          numberSize: 60,
                          cmOrKgSize: 18,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Column(
                          children: [
                            AutoSizeText(
                              'MALE',
                              style: greyTextStyle.copyWith(
                                color: broca.color,
                                fontSize: 16,
                                fontWeight: semiBold,
                                letterSpacing: 1,
                              ),
                              group: group1,
                              maxLines: 1,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            AutoSizeText(
                              '${broca.height.toStringAsFixed(0)} cm',
                              style: whiteTextStyle.copyWith(
                                color: greyColor,
                                fontSize: 16,
                                fontWeight: black,
                                letterSpacing: 1,
                              ),
                              group: group1,
                              maxLines: 1,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        AutoSizeText(
                          'Keep exercising and eat healthy\nfood to keep your healthy body!',
                          style: whiteTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: semiBold,
                            letterSpacing: 1,
                          ),
                          group: group1,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                borderColor: thirdColor,
                color: mainColor.withOpacity(0.8),
              ),
            ),
          ),

// ignore: todo
// TODO : RE-CALCULATE BUTTON

          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const CustomHeader(
              title: 'RE-CALCULATE',
              customWidth: double.infinity,
              customHeight: 80,
              customBorderRadius: null,
            ),
          ),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(
          'HEALTHY BODY',
          style: whiteTextStyle.copyWith(
            fontSize: 24,
            fontWeight: semiBold,
            letterSpacing: 1,
          ),
          maxLines: 1,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: mainColor,
      ),
      body: Stack(
        children: [
          backgroundColor(),
          body(),
        ],
      ),
    );
  }
}
