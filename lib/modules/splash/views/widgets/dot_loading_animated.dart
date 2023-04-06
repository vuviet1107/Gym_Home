import 'package:flutter/material.dart';

class DotLoadingAnimated extends StatefulWidget {
  const DotLoadingAnimated({Key? key, this.dotLenght}) : super(key: key);
  final int? dotLenght;
  @override
  State<DotLoadingAnimated> createState() => _DotLoadingAnimatedState();
}

class _DotLoadingAnimatedState extends State<DotLoadingAnimated> with TickerProviderStateMixin {
  List<AnimationController> listController = [];
  List<Animation> listAnimation = [];
  @override
  void initState() {
    super.initState();
    initList();
    handleList();
  }

  initList() async {
    for (int i = 0; i < (widget.dotLenght ?? 0); i++) {
      listController.add(AnimationController(vsync: this, duration: const Duration(milliseconds: 500)));
      listAnimation.add(Tween<double>(begin: 0, end: 1).animate(listController[i])
        ..addStatusListener((staus) {
          handleStatus(staus, i);
        }));
    }
  }

  disPoseAnimation() {
    listController.forEach((element) {
      element.dispose();
    });
  }

  handleStatus(AnimationStatus status, int index) {
    if (status == AnimationStatus.completed) {
      listController[index].reverse();
    }
    if (status == AnimationStatus.dismissed) {
      listController[index].forward();
    }
  }

  handleList() async {
    for (int i = 0; i < listController.length; i++) {
      listController[i].forward();
      await Future.delayed(const Duration(milliseconds: 100));
    }
  }

  @override
  void dispose() {
    disPoseAnimation();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
          listController.length,
              (index) => DotPadding(
            // rightPadding: (listController.length - 1 < index) ? 0 : 10,
              animation: listAnimation[index],
              animationController: listController[index])),
    );
  }
}

class DotPadding extends StatefulWidget {
  const DotPadding({Key? key, @required this.animation, @required this.animationController, this.rightPadding})
      : super(key: key);
  final AnimationController? animationController;
  final Animation? animation;
  final double? rightPadding;
  @override
  State<DotPadding> createState() => _DotPaddingState();
}

class _DotPaddingState extends State<DotPadding> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return DotAnimated(
      listenable: widget.animation!,
      rightPadding: widget.rightPadding,
    );
  }
}

class DotAnimated extends AnimatedWidget {
  const DotAnimated({super.key, required Listenable listenable, this.rightPadding}) : super(listenable: listenable);
  final double? rightPadding;
  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation;
    return Padding(
        child: Container(
          height: 2,
          width: 2,
          decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(50)),
        ),
        padding: EdgeInsets.only(left: 5, top: 10.0 * animation.value, bottom: (10.0 * (1 - animation.value))));
  }
}
