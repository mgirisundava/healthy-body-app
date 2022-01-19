import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:healthy_body_app/providers/bmi_provider.dart';
import 'package:healthy_body_app/widgets/custom_card.dart';
import 'package:healthy_body_app/widgets/custom_counter_card.dart';
import 'package:healthy_body_app/widgets/custom_header.dart';
import 'package:healthy_body_app/widgets/value_string.dart';
import 'package:provider/provider.dart';

import '../theme.dart';
import '../widgets/about_bottom_sheet.dart';
import '../widgets/main_drawer.dart';
import 'bmi_result_page.dart';

class BmiPage extends StatelessWidget {
  const BmiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bmi = Provider.of<BmiProvider>(context);
    // ignore: todo
// TODO : ABOUT BOTTOM SHEET

    void _showMyBottomSheet() {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const AboutBottomSheet(
              description:
                  'Body mass index (BMI) is a person’s weight in kilograms divided by the square of height in meters. BMI is an inexpensive and easy screening method for weight category—underweight, normal weight, and overweight.\n\nDisclaimer: This tool should NOT be considered as a substitute for any professional medical service, NOR as a substitute for clinical judgement.',
            ),
          ); // returns your BottomSheet widget
        },
      );
    }

// ignore: todo
// TODO : BACKGROUND COLOR

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
            padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
            child: CustomHeader(
              title: 'BMI CALCULATOR',
              customWidth: double.infinity,
              customHeight: 60,
              customBorderRadius: BorderRadius.circular(10),
            ),
          ),

// ignore: todo
// TODO : CALCULATOR BODY SECTION

// ignore: todo
// TODO : WEIGHT

          Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                child: CustomCard(
                  color: mainColor,
                  borderColor: thirdColor,
                  child: CustomCounterCard(
                    value: bmi.weight.toStringAsFixed(0),
                    title: 'WEIGHT',
                    subTitle: 'KILOGRAM',
                    onDecrement: bmi.weightDecrement,
                    onIncrement: bmi.weightIncrement,
                  ),
                ),
              )),

// ignore: todo
// TODO : HEIGHT

          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: CustomCard(
                color: mainColor.withOpacity(0.8),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            color: secondColor,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              width: 3,
                              color: thirdColor,
                            ),
                          ),
                          child: FittedBox(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Center(
                                  child: AutoSizeText(
                                    'HEIGHT',
                                    style: greyTextStyle.copyWith(
                                      fontSize: 18,
                                      fontWeight: semiBold,
                                      letterSpacing: 1,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                ValueString(
                                    value: bmi.height.toStringAsFixed(0),
                                    cmOrKg: 'cm',
                                    numberSize: 40,
                                    cmOrKgSize: 18),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Slider(
                          value: bmi.height,
                          activeColor: whiteColor,
                          inactiveColor: whiteColor.withOpacity(0.3),
                          min: 50.0,
                          max: 250,
                          divisions: 250,
                          onChanged: (newValue) {
                            bmi.height = newValue.roundToDouble();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                borderColor: thirdColor,
              ),
            ),
          ),

// ignore: todo
// TODO : CALCULATE SECTION

          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (ctx) => const BmiResultPage()));
            },
            child: const CustomHeader(
              title: 'LET\'S CALCULATE',
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
        actions: [
          IconButton(
            onPressed: () {
              _showMyBottomSheet();
            },
            icon: const Icon(Icons.info),
          ),
        ],
      ),
      drawer: const MainDrawer(),
      body: Stack(
        children: [
          backgroundColor(),
          body(),
        ],
      ),
    );
  }
}
