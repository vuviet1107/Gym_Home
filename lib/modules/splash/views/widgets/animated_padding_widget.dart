import 'package:flutter/material.dart';

class AnimatedPaddingWidget extends StatefulWidget {
  const AnimatedPaddingWidget(
      {Key? key,
        // this.textStyle,
        this.child,
        required this.duration,
        this.startPadding,
        this.completedCallBack,
        this.endPadding,
        this.curve,
        this.activeOpacity,

        /// set begin=0, end =1
        required this.animateTween})
      : super(key: key);
  // final TextStyle? textStyle;
  final Widget? child;
  final Duration? duration;
  final EdgeInsets? startPadding;
  final EdgeInsets? endPadding;
  final Curve? curve;
  final bool? activeOpacity;
  final Function(AnimationStatus status)? completedCallBack;

  /// tween for animated
  final Tween<double>? animateTween;
  @override
  State<AnimatedPaddingWidget> createState() => _AnimatedPaddingWidgetState();
}

class _AnimatedPaddingWidgetState extends State<AnimatedPaddingWidget> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation animation;
  @override
  void initState() {
    /// init animation
    animationController = AnimationController(vsync: this, duration: widget.duration);
    animation = widget.animateTween!
        .animate(CurvedAnimation(parent: animationController, curve: widget.curve ?? Curves.decelerate))
      ..addStatusListener((status) {
        // print({status});

        /// call status
        widget.completedCallBack?.call(status);
      });
    animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextAnimated(
      activeOpacity: widget.activeOpacity,
      text: widget.child,
      // textStyle: widget.textStyle,
      startPadding: widget.startPadding,
      endPadding: widget.endPadding,
      listenable: animation,
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}

// ignore: must_be_immutable
class TextAnimated extends AnimatedWidget {
  const TextAnimated(
      {Key? key,
        required Listenable listenable,
        this.text,
        this.textStyle,
        this.endPadding,
        this.activeOpacity,
        this.startPadding})
      : super(key: key, listenable: listenable);
  final TextStyle? textStyle;
  final Widget? text;
  final EdgeInsets? startPadding;
  final EdgeInsets? endPadding;
  final bool? activeOpacity;
  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    // print("========");
    // print(animation.value * 3);
    // _add += (0.5 * 9.8 * pow(animation.value * 3, 2));
    // print(_add);
    return Opacity(
      opacity: activeOpacity == false ? 1 : animation.value,
      child: Padding(
        padding: topPadding(animation), //, topPadding(animation),
        child: text,
      ),
    );
  }

  EdgeInsets topPadding(animation) {
    return EdgeInsets.only(
      top: (startPadding?.top ?? 0) + paddingEnd((startPadding?.top ?? 0), (endPadding?.top ?? 0)) * animation.value,
      right: (startPadding?.right ?? 0) +
          paddingEnd((startPadding?.right ?? 0), (endPadding?.right ?? 0)) * animation.value,
      left:
      (startPadding?.left ?? 0) + paddingEnd((startPadding?.left ?? 0), (endPadding?.left ?? 0)) * animation.value,
      bottom: (startPadding?.bottom ?? 0) +
          paddingEnd((startPadding?.bottom ?? 0), (endPadding?.bottom ?? 0)) * animation.value,
    );
  }

  double paddingEnd(double start, double end) {
    double e = 0;
    if (start > end) {
      e = -(start - end);
    } else {
      e = end;
    }
    return e;
  }
}
