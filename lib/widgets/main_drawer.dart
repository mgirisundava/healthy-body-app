import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:healthy_body_app/pages/bmi_page.dart';
import 'package:healthy_body_app/pages/broca_page.dart';
import 'package:healthy_body_app/theme.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    final group1 = AutoSizeGroup();

    Widget drawerItem(String title, Widget navigateTo) {
      return InkWell(
        onTap: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => navigateTo));
        },
        child: ListTile(
          title: AutoSizeText(
            title,
            style: whiteTextStyle.copyWith(
              fontSize: 18,
              fontWeight: semiBold,
              letterSpacing: 1,
              overflow: TextOverflow.ellipsis,
            ),
            group: group1,
            maxLines: 1,
          ),
          trailing: Icon(
            Icons.chevron_right,
            color: whiteColor,
          ),
        ),
      );
    }

    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.all(20),
              color: secondColor,
              child: Center(
                  child: AutoSizeText(
                'Let\'s Calculate Your Healthy Body',
                style: whiteTextStyle.copyWith(
                  fontSize: 24,
                  height: 1.5,
                  fontWeight: semiBold,
                  letterSpacing: 1,
                ),
                maxLines: 2,
              )),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              color: mainColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: thirdColor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Spacer(),
                        AutoSizeText(
                          'SELECT CALCULATOR',
                          style: whiteTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: semiBold,
                            letterSpacing: 1,
                          ),
                          maxLines: 1,
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                  drawerItem('BMI CALCULATOR', const BmiPage()),
                  drawerItem('BROCA INDEX CALCULATOR', const BrocaPage()),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
