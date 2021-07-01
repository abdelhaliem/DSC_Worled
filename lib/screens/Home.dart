import 'package:flutter/material.dart';
import 'package:splash_screen_view/ColorizeAnimatedText.dart';
import 'package:travel/color.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ColorizeAnimatedText(
            colors: [ColoresDark.red, Colors.green, Colors.blue],
            text:
                'اسف فريق دي اس سي الازهر انا مقدرتش اعمل الجزء بتاع المفضله لان انا مخلص امتحانات يوم 26 ف ملحقتش اخلص الجزء ده',
            speed: Duration(
              milliseconds: 1000,
            ),
            textStyle: TextStyle(color: Colors.amber, fontSize: 40),
          ),
        ),
      ),
    );
  }
}
