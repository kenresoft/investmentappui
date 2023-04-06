import 'dart:ui';

import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:extensionresoft/extensionresoft.dart';
import 'package:flutter/material.dart';
import 'package:fontresoft/fontresoft.dart';

import '../providers/providers.dart';
import '../routes/library.dart';
import '../widgets/paint.dart';

class Investment extends ConsumerStatefulWidget {
  const Investment({Key? key}) : super(key: key);

  @override
  ConsumerState<Investment> createState() => _InvestmentState();
}

class _InvestmentState extends ConsumerState<Investment> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: backgroundLinearGradient()),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: CustomPaint(
            painter: CustomBackground(gradient: buildLinearGradient()),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
                65.spaceY(),

                /// Text Bold
                'Classify transaction'.edit(textStyle: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold), textAlign: TextAlign.start),
                12.spaceY(),

                /// Text
                230.spaceX('Classify this transaction into a particular category'.edit(textStyle: const TextStyle(color: Colors.white, fontSize: 15))),
                20.spaceY(),

                /// Grid
                Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
                  Row(
                    children: [
                      buildClipRRect(color: Colors.blue, label: 'General', resource: Constant.profile),
                      20.spaceX(),
                      buildClipRRect(color: Colors.deepPurple, label: 'Transport', resource: Constant.profile),
                    ],
                  ),
                  20.spaceY(),
                  Row(
                    children: [
                      buildClipRRect(color: Colors.pink, label: 'Shopping', resource: Constant.profile),
                      20.spaceX(),
                      buildClipRRect(color: Colors.orange, label: 'Bills', resource: Constant.profile),
                    ],
                  ),
                  20.spaceY(),
                  Row(
                    children: [
                      buildClipRRect(color: Colors.indigo, label: 'Entertainment', resource: Constant.profile),
                      20.spaceX(),
                      buildClipRRect(color: Colors.green, label: 'Grocery', resource: Constant.profile),
                    ],
                  ),
                ]),
                30.spaceY(),
              ]),
            ),
          ),
        ),
        bottomNavigationBar: Theme(
          data: ThemeData(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
          ),
          child: 80.spaceY(
            BottomBarFloating(
              enableShadow: false,
              iconSize: 26,
              indexSelected: ref.watch(tabProvider.select((value) => value)),
              onTap: (int index) {
                ref.watch(tabProvider.notifier).setTab = index;
              },
              backgroundColor: const Color(0x6f373856),
              color: const Color(0xff71739A),
              colorSelected: const Color(0xffFF6FB5),
              items: const [
                TabItem(title: "", icon: Icons.calendar_month),
                TabItem(title: "", icon: Icons.bar_chart),
                TabItem(title: "", icon: Icons.perm_identity),
              ],
            ),
          ),
        ),
      ),
    );
  }

  LinearGradient buildLinearGradient() => const LinearGradient(
        //colors: [Color(0xffff758f), Color(0xffff00df)],
        colors: [Color(0xffFF93A8), Color(0xffFF46C4)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      );

  LinearGradient backgroundLinearGradient() => const LinearGradient(
        colors: [Color(0xff363568), Color(0xff24253A)], //0xff2d4372
        begin: Alignment.topCenter,
        end: Alignment.bottomRight,
      );

  ClipRRect buildClipRRect({required String resource, required String label, required Color color}) => ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Container(
            color: const Color(0x7f4c4d72), // 0x7f373856 //0x6f43336e
            height: 170,
            width: 150,
            child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                height: 55,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color,
                  image: DecorationImage(image: ExactAssetImage(resource)),
                ),
                //child: Container(color: Colors.pinkAccent, child: Icon(Icons.account_circle_sharp, size: 20)),
              ),
              20.spaceY(),
              label.edit(textStyle: TextStyle(color: color, fontWeight: FontWeight.bold), textAlign: TextAlign.center)
            ]),
          ),
        ),
      );
}
