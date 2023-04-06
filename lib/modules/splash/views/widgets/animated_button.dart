import 'package:flutter/material.dart';

class AnimatedButton extends StatefulWidget {
  const AnimatedButton({
    Key? key,
    this.start,
    this.loadingWidget,
    this.loadingState,
    this.onTap,
    this.end,
    // this.textStyle,
    // this.color,
    this.decoration,
  }) : super(key: key);
  final Widget? start;
  final Widget? loadingWidget;
  final Widget? end;
  final Widget? loadingState;
  // final TextStyle? textStyle;
  /// function(EndState, StartState, loadingState)
  final Function(Function() callEndState, Function() callStartState, Function() loadingStateCall)? onTap;
  // final Color? color;
  final BoxDecoration? decoration;
  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> with TickerProviderStateMixin {
  @override
  void initState() {
    animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
    animation = Tween<double>(begin: 0, end: 1).animate(animationController)..addStatusListener((status) {});
    animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          widget.onTap?.call(endStateCall, startStateCall, loadingStateCall);
        },
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: widget.decoration,
          child: start(),
        ),
      ),
    );
  }

  ValueNotifier<bool> isShowLoading = ValueNotifier(false);
  late Animation animation;
  late AnimationController animationController;
  ValueNotifier<bool> isStartState = ValueNotifier(true);
  Widget start() {
    return ValueListenableBuilder(
      valueListenable: isShowLoading,
      builder: (ctx, d, child) {
        return !isShowLoading.value ? buildStart() : buildLoading();
      },
    );
  }

  Widget buildLoading() {
    return widget.loadingState ?? Container();
  }

  endStateCall() {
    isShowLoading.value = false;
    isStartState.value = false;
    animationController.forward().then((value) {});
  }

  startStateCall() {
    isShowLoading.value = false;
    isStartState.value = true;
    animationController.forward().then((value) {});
  }

  loadingStateCall() {
    animationController.reverse().then((value) {
      isShowLoading.value = true;
    });
  }

  Widget buildStart() {
    return ValueListenableBuilder(
      valueListenable: isStartState,
      builder: (context, value, child) {
        return Container(
          // padding: EdgeInsets.only(top: 3),
          // height: 25,
            child: AnimatedOpacityText(
              listenable: animation,
              child: isStartState.value ? widget.start : widget.end,
            ));
      },
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}

class AnimatedOpacityText extends AnimatedWidget {
  const AnimatedOpacityText({super.key, required Listenable listenable, this.child}) : super(listenable: listenable);
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation;
    return Opacity(
      opacity: animation.value,
      child: child,
    );
  }
}
