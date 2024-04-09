import 'package:flutter/material.dart';

class built_in extends StatefulWidget {
  const built_in({super.key});

  @override
  State<built_in> createState() => _built_inState();
}

class _built_inState extends State<built_in> {
  double _opacity = 1;
  double _margin = 0;
  double _width = 200;
  Color _color = Colors.deepPurple;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: Duration(
          seconds: 1,
        ),
        margin: EdgeInsets.all(_margin),
        width: _width,
        color: _color,
        child: Column(
          children: <Widget>[
            ElevatedButton(
              onPressed: () => setState(() => _margin = 50),
              child: Text(
                'Animation margin',
              ),
            ),
            ElevatedButton(
              onPressed: () => setState(() => _color = Colors.blue),
              child: Text(
                'Animation color',
              ),
            ),
            ElevatedButton(
              onPressed: () => setState(() => _width = 400),
              child: Text(
                'Animation width',
              ),
            ),
            ElevatedButton(
              onPressed: () => setState(() => _opacity = 0),
              child: Text(
                'Animation opacity',
              ),
            ),
            AnimatedOpacity(
              opacity: _opacity,
              duration: Duration(seconds: 1),
              child: Text(
                'hide me',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
