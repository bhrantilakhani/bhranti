import 'dart:math' show pi;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class animation_3D extends StatefulWidget {
  const animation_3D({super.key});

  @override
  State<animation_3D> createState() => _animation_3DState();
}

class _animation_3DState extends State<animation_3D>
    with SingleTickerProviderStateMixin {
  double widthAndHeight = 200.0;

  late AnimationController _controller;
  // late AnimationController _xCantroller;
  // late AnimationController _yCantroller;
  // late AnimationController _zCantroller;
  late Tween<double> _animation;

  @override
  // ignore: unused_element
  initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    );
    // _xCantroller = AnimationController(
    //   vsync: this,
    //   duration: const Duration(seconds: 20),
    // );
    // _yCantroller = AnimationController(
    //   vsync: this,
    //   duration: const Duration(seconds: 30),
    // );
    // _zCantroller = AnimationController(
    //   vsync: this,
    //   duration: const Duration(seconds: 40),
    // );

    _animation = Tween<double>(begin: 0, end: pi * 2);
  }

  @override
  void dispose() {
    _controller.dispose();
    // _xCantroller.dispose();
    // _yCantroller.dispose();
    // _zCantroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller
      ..reset()
      ..reset();
    // _xCantroller
    //   ..reset()
    //   ..repeat();

    // _yCantroller
    //   ..reset()
    //   ..repeat();

    // _zCantroller
    //   ..reset()
    //   ..repeat();
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: widthAndHeight,
              width: double.infinity,
            ),
            AnimatedBuilder(
              animation: Listenable.merge([_controller]
                  // [_xCantroller, _yCantroller, _zCantroller],
                  ),
              builder: (context, child) {
                return Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..rotateX(_animation.evaluate(_controller))
                    ..rotateY(_animation.evaluate(_controller))
                    ..rotateZ(_animation.evaluate(_controller)),
                  // ..rotateX(_animation.evaluate(_xCantroller))
                  // ..rotateY(_animation.evaluate(_yCantroller))
                  // ..rotateZ(_animation.evaluate(_zCantroller)),
                  child: Stack(
                    children: [
                      Container(
                        height: widthAndHeight,
                        width: widthAndHeight,
                        color: Colors.amber,
                      )
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
