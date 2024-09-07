import 'package:fast_app_base/common/common.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widget/w_arrow.dart';

class AnimatedAppBar extends StatefulWidget {
  final String title;
  final ScrollController scrollController;
  final AnimationController animationController;

  const AnimatedAppBar(
    this.title, {
    super.key,
    required this.scrollController,
        required this.animationController,
  });

  @override
  State<AnimatedAppBar> createState() => _AnimatedAppBarState();
}

class _AnimatedAppBarState extends State<AnimatedAppBar> {
  Duration get duration => 10.ms;
  double scrollPosition = 0;
  late Animation<double> animation = CurvedAnimation(parent: widget.animationController, curve: Curves.bounceInOut);

  @override
  void initState() {
    widget.animationController.addListener(() {
      setState(() {});
    });
    widget.scrollController.addListener(() {
      scrollPosition = widget.scrollController.position.pixels;
    });
    super.initState();
  }

  bool get isTriggered => scrollPosition > 4;

  bool get isNotTriggered => !isTriggered;

  double getValue(double initial, double target) {
    if (isTriggered) {
      return target;
    }
    double fraction = scrollPosition / 40;
    return initial + (target - initial) * fraction;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: context.backgroundColor,
      child: SafeArea(
        child: Stack(
          children: [
            AnimatedContainer(
              duration: duration,
              padding: EdgeInsets.only(
                  left: getValue(20, 50), top: getValue(50, 15)),
              child: AnimatedDefaultTextStyle(
                child: widget.title.text.make(),
                style: TextStyle(
                    fontSize: isNotTriggered ? 30 : 18,
                    fontWeight: FontWeight.bold),
                duration: duration,
              ),
            ),
            Tap(
              onTap: () {
                Nav.pop(context);
              },
              child: const Arrow(
                direction: AxisDirection.left,
              ),
            ).p20(),
            Positioned(
              left: animation.value * 200,
              child: TweenAnimationBuilder<Color?>(
                tween: ColorTween(
                    begin: Colors.green,
                    end: isTriggered ? Colors.orange : Colors.green),
                duration: 1000.ms,
                builder: (context, value, child) => ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    value ?? Colors.green,
                    BlendMode.modulate,
                  ),
                  child: child,
                ),
                child: Image.asset(
                  '$basePath/icon/map_point.png',
                  height: 60,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
