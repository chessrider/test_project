import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

///Main Widget
class MyApp extends StatelessWidget {
  ///Constructor
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

///Home Widget
class MyHomePage extends StatefulWidget {
  ///Constructor
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Color backgroundColor;
  late double positionCursor; //Horizontal cursor position

  @override
  void initState() {
    backgroundColor = Colors.white;
    positionCursor = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    // ignore: newline-before-return
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          //changing background to random color on click
          setState(
            () => backgroundColor = Color.fromRGBO(
              Random().nextInt(255),
              Random().nextInt(255),
              Random().nextInt(255),
              (width - positionCursor) / width,
            ),
          );
        },
        onHorizontalDragUpdate: (details) {
          //сhanging the background alpha depending on the horizontal position of the cursor
          setState(() {
            final alpha = (((width - details.localPosition.dx) / width) * 255).toInt();
            backgroundColor = backgroundColor.withAlpha(alpha);
            positionCursor = details.localPosition.dx;
          });
        },
        child: MouseRegion(
          onEnter: (event) => positionCursor = event.localPosition.dx,
          onHover: (event) {
            //сhanging the background alpha depending on the horizontal position of the cursor
            setState(() {
              final alpha = (((width - event.localPosition.dx) / width) * 255).toInt();
              backgroundColor = backgroundColor.withAlpha(alpha);
              positionCursor = event.localPosition.dx;
            });
          },
          onExit: (event) => positionCursor = event.localPosition.dx,
          child: Container(
            color: backgroundColor,
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
