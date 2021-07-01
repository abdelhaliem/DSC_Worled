import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'package:travel/blocs/theme.dart';
import 'screens/bottomNav.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeChanger(ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.white,
        colorScheme: ColorScheme.light(),
        switchTheme: SwitchThemeData(
            thumbColor: MaterialStateProperty.all(Colors.white),
            trackColor: MaterialStateProperty.all(Colors.red)),
      )),
      child: MaterialAppTheme(),
    );
  }
}

class MaterialAppTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return MaterialApp(
      title: 'DSC World',
      theme: theme.getTheme(),
      debugShowCheckedModeBanner: false,
      home: SplahScreen(),
    );
  }
}

class SplahScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      navigateRoute: MyHomePage(),
      duration: 3000,
      imageSize: 180,
      imageSrc: "assets/images/logoApp.png",
      // text: "DSC World",
      textType: TextType.TyperAnimatedText,
      textStyle: TextStyle(
        fontSize: 30.0,
      ),
      backgroundColor: Colors.white,
    );
  }
}
