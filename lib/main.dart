import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

///Main Widget
class MyApp extends StatelessWidget {
  ///constructor
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

///Home Widget
class MyHomePage extends StatefulWidget {
  ///constructor
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Color color;
  late double position;

  @override
  void initState() {
    color = Colors.white;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    // ignore: newline-before-return
    return Scaffold(
      body: GestureDetector(
        onTap: () => setState(
          () => color = Color.fromRGBO(
            Random().nextInt(255),
            Random().nextInt(255),
            Random().nextInt(255),
            (width - position) / width,
          ),
        ),
        child: MouseRegion(
          onEnter: (event) => position = event.localPosition.dx,
          onHover: (event) => setState(() {
            final alpha = (((width - event.localPosition.dx) / width) * 255).toInt();
            color = color.withAlpha(alpha);
            position = event.localPosition.dx;
          }),
          onExit: (event) => position = event.localPosition.dx,
          child: Container(
            color: color,
            alignment: Alignment.center,
            child: const Text(
              "Hello, there",
            ),
          ),
        ),
      ),
    );
  }
}
