import 'package:flutter/material.dart';

class CurvesAnimation extends StatefulWidget {
  const CurvesAnimation({Key? key}) : super(key: key);

  @override
  State<CurvesAnimation> createState() => _CurvesAnimationState();
}

class _CurvesAnimationState extends State<CurvesAnimation>
    with SingleTickerProviderStateMixin {
  bool idFav = false;
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;
  late Animation<double> _sizeAnimation;
  late CurvedAnimation _curve;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _curve = CurvedAnimation(parent: _controller, curve: Curves.linear);

    _colorAnimation =
        ColorTween(begin: Colors.grey, end: Colors.red).animate(_curve);

    _sizeAnimation = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem(
          tween: Tween<double>(begin: 30, end: 50),
          weight: 50,
        ),
        TweenSequenceItem(
          tween: Tween<double>(begin: 50, end: 30),
          weight: 50,
        )
      ],
    ).animate(_curve);

    _controller.addListener(() {
      setState(() {});
    });

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          idFav = true;
        });
      }
      if (status == AnimationStatus.dismissed) {
        setState(() {
          idFav = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, _) {
        return IconButton(
          onPressed: () {
            idFav ? _controller.reverse() : _controller.forward();
          },
          icon: Icon(
            Icons.favorite,
            color: _colorAnimation.value,
            size: _sizeAnimation.value,
          ),
        );
      },
    );
  }
}
