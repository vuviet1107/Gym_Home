import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:flutter_html/style.dart';
import 'dart:math' as math;

import '../../../../routes/app_pages.dart';
import 'animated_button.dart';
import 'animated_padding_widget.dart';
import 'dot_loading_animated.dart';

class FirstWelcome extends StatefulWidget {
  const FirstWelcome({Key? key}) : super(key: key);

  @override
  State<FirstWelcome> createState() => _FirstWelcomeState();
}

class _FirstWelcomeState extends State<FirstWelcome> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  ValueNotifier<Tween<double>> changeText = ValueNotifier(Tween<double>(begin: 0, end: 0));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // color: Colors.red,
        height: double.infinity,
        width: double.infinity,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimatedPaddingWidget(
                  child: Transform.rotate(
                    angle: math.pi / 5,
                    child: Container(
                        color: Colors.blue,
                        // padding: EdgeInsets.all(5),
                        child: const Text(
                          "Wellcome",
                          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 30),
                        )),
                  ),
                  duration: Duration(seconds: 5),
                  // curve: Curves.bounceOut,
                  startPadding: const EdgeInsets.only(left: 0, top: 0),
                  endPadding: const EdgeInsets.only(left: 250, top: 100),
                  completedCallBack: (status) {
                    if (status == AnimationStatus.completed) {
                      changeText.value = Tween<double>(begin: 1, end: 0);
                    }
                  },
                  animateTween: Tween<double>(begin: 0, end: 1)),

              /// second Text
              ValueListenableBuilder(
                  valueListenable: changeText,
                  child: Container(),
                  builder: (context, dyna, child) {
                    return Column(
                      children: [
                        AnimatedPaddingWidget(
                          curve: Curves.bounceOut,
                          key: UniqueKey(),
                          duration: Duration(milliseconds: 700),
                          startPadding: EdgeInsets.only(left: 100),
                          endPadding: EdgeInsets.only(left: 0),
                          animateTween: dyna as Tween<double>,
                          child: Container(
                            height: 100,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                Container(
                                    height: 100, width: 100, color: Colors.red, margin: EdgeInsets.only(right: 10)),
                                Container(
                                    height: 100, width: 100, color: Colors.red, margin: EdgeInsets.only(right: 10)),
                                Container(
                                    height: 100, width: 100, color: Colors.red, margin: EdgeInsets.only(right: 10)),
                                Container(
                                    height: 100, width: 100, color: Colors.red, margin: EdgeInsets.only(right: 10)),
                                Container(
                                    height: 100, width: 100, color: Colors.red, margin: EdgeInsets.only(right: 10)),
                              ],
                            ),
                          ),
                        ),

                        ///
                        AnimatedPaddingWidget(
                            key: UniqueKey(),
                            child: const Text(
                              "WELCOME TO PRINTEREST",
                              style: TextStyle(fontSize: 20, color: Colors.red, fontWeight: FontWeight.bold),
                            ),
                            duration: Duration(seconds: 10),
                            startPadding: const EdgeInsets.only(top: 100, left: 0),
                            endPadding: const EdgeInsets.only(top: 10, right: 0),
                            completedCallBack: (status) {},
                            animateTween: dyna),

                        /// Button with state

                        changeText.value.end == 1
                            ? AnimatedPaddingWidget(
                                activeOpacity: false,
                                curve: Curves.bounceOut,
                                duration: Duration(seconds: 3),
                                startPadding: EdgeInsets.only(top: 0),
                                endPadding: EdgeInsets.only(top: 100),
                                animateTween: dyna,
                                child: Hero(
                                  tag: "hero",
                                  child: AnimatedButton(
                                    onTap: ((callEndState, callStartState, loadingStateCall) async {
                                      loadingStateCall.call();

                                      ///Call api or something here
                                      await Future.delayed(Duration(seconds: 0));

                                      callEndState.call();
                                      Get.toNamed(Routes.HOME, arguments: "HELLo");
                                    }),
                                    loadingState: Container(
                                        height: 25, width: 100, child: const DotLoadingAnimated(dotLenght: 3)),
                                    end: Container(
                                        height: 25,
                                        width: 100,
                                        child: const Center(
                                            child: Text(
                                          "done",
                                          style: TextStyle(color: Colors.red),
                                        ))),
                                    start: Container(
                                        height: 25,
                                        width: 100,
                                        child: const Center(child: Text("", style: TextStyle(color: Colors.blue)))),
                                    decoration: BoxDecoration(
                                        border: Border.all(),
                                        color: Colors.yellow,
                                        borderRadius: BorderRadius.circular(50)),
                                  ),
                                ),
                              )
                            : Container(),
                      ],
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }

  ValueNotifier<bool> down = ValueNotifier(false);
  Widget card() {
    var width = MediaQuery.of(context).size.width * 0.5;
    var height = MediaQuery.of(context).size.height * 0.2;
    return Container(
      color: Colors.red,
      width: width,
      height: height,
      child: Stack(
        children: [
          GestureDetector(
            onPanUpdate: (details) {
              if (details.delta.dy > 0) {
                down.value = true;
              }
              if (details.delta.dy < 0) {
                down.value = false;
              }
            },
            child: ValueListenableBuilder(
              valueListenable: down,
              builder: (context, value, child) {
                return AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(down.value ? 50 : 0),
                    color: Colors.yellow,
                  ),
                  margin: EdgeInsets.only(top: down.value ? 100 : 0),
                  width: width,
                  height: height / 2,
                );
              },
            ),
          ),
          Container(
            width: width,
            height: height / 2,
          )
        ],
      ),
    );
  }
}
