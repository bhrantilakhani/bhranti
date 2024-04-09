import 'package:flutter/material.dart';

class tween_sequences extends StatefulWidget {
  const tween_sequences({super.key});

  @override
  State<tween_sequences> createState() => _tween_sequencesState();
}

class _tween_sequencesState extends State<tween_sequences>
    with SingleTickerProviderStateMixin {
  bool idFav = false;
  late AnimationController _controller;
  late Animation _colorAnimation;
  late Animation<double> _sizeanimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _colorAnimation =
        ColorTween(begin: Colors.grey, end: Colors.red).animate(_controller);

    _sizeanimation = TweenSequence(
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
    ).animate(_controller);
    // _controller.forward();

    _controller.addListener(() {
      print(_controller.value);
      print(_colorAnimation.value);
    });
    // _controller.addStatusListener((status) {
    //   print(status);
    // });

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
            size: _sizeanimation.value,
          ),
        );
      },
    );
  }
}
