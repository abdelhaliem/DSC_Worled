import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splash_screen_view/TyperAnimatedText.dart';
import 'package:travel/blocs/theme.dart';
import 'package:day_night_switcher/day_night_switcher.dart';
import '../color.dart';
import 'Home.dart';
import 'catWorld.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //=================Bottom Nav Start =========>
  int curTap = 0;
  final List<Widget> screens = [
    Home(),
    Catigores(),
  ];
  final PageStorageBucket bucket = PageStorageBucket();
  Widget curScreen = Catigores();

  //=================Bottom Nav end =========>

  bool menuOpen = false;
  double tranx = 0, trany = 0, scale = 1.0;
  double value = 0;
  bool vl;
  bool themedark = false;

//=================snak bar start =========>
  final _x = GlobalKey<ScaffoldState>();
  snakBar({String text, IconData icon}) {
    final sBar = SnackBar(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      duration: Duration(seconds: 1),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.black,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
    _x.currentState.showSnackBar(sBar);
  }
  //=================snak bar end =========>

  @override
  Widget build(BuildContext context) {
    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);
    return Scaffold(
      key: _x,
      body: Stack(
        children: [
//================Start Drawe===============>
          Container(
            color: ColoresDark.red,
          ),
          SafeArea(
            child: Container(
              width: 200,
              child: Column(
                children: [
                  DrawerHeader(
                    child: Image.asset("assets/images/logoApp.png"),
                  ),
                  TyperAnimatedText(
                    text: "halem Hamza",
                    speed: Duration(
                      milliseconds: 500,
                    ),
                    textStyle: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                  Divider(
                    indent: 20,
                    endIndent: 20,
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                    ),
                    child: ListTile(
                      onTap: () {
                        setState(() {
                          menuOpen = false;
                          value == 0 ? value = 1 : value = 0;
                        });
                      },
                      leading: Icon(Icons.home, color: ColoresDark.red),
                      title: Text("Home",
                          style: TextStyle(color: ColoresDark.red)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white.withOpacity(0.2),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            "Dark Mode",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        DarkModeSwitch(
                          theme: _themeChanger,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
//================ End Drawe ===============>

//================ Start Home Page & Nav Bar ===============>

          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            transform: Matrix4.translationValues(tranx, trany, 0)..scale(scale),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: menuOpen
                    ? BorderRadius.circular(30)
                    : BorderRadius.circular(0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 30,
                    offset: Offset(10, 10),
                  )
                ],
              ),
              child: ClipRRect(
                borderRadius: menuOpen
                    ? BorderRadius.circular(30)
                    : BorderRadius.circular(0),
                child: Scaffold(
                  appBar: AppBar(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TyperAnimatedText(
                          text: "DSC World",
                          speed: Duration(
                            milliseconds: 500,
                          ),
                          textStyle: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        DayNightSwitcherIcon(
                          isDarkModeEnabled: themedark,
                          dayBackgroundColor: Colors.white.withOpacity(0.5),
                          cloudsColor: ColoresDark.red,
                          onStateChanged: (val) {
                            setState(() {
                              this.themedark = val;
                            });
                          },
                        ),
                      ],
                    ),
                    backgroundColor: ColoresDark.red,
                    centerTitle: true,
                    leading: menuOpen
                        ? IconButton(
                            icon:
                                Icon(Icons.arrow_back_ios, color: Colors.white),
                            onPressed: () {
                              tranx = 0;
                              trany = 0;
                              scale = 1.0;
                              setState(() {
                                menuOpen = false;
                                // value == 0 ? value = 1 : value = 0;
                              });
                            },
                          )
                        : IconButton(
                            icon: Icon(Icons.menu, color: Colors.white),
                            onPressed: () {
                              tranx = 200;
                              trany = 120;
                              scale = 0.6;

                              setState(() {
                                menuOpen = true;
                                // value == 0 ? value = 1 : value = 0;
                              });
                            },
                          ),
                  ),
                  body: PageStorage(
                    bucket: bucket,
                    child: curScreen,
                  ),
                  bottomNavigationBar: BottomAppBar(
                    //color: Colors.amber,
                    shape: CircularNotchedRectangle(),
                    notchMargin: 8,
                    elevation: 0,
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: ColoresDark.red,
                      ),
                      height: 70,
                      child: Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: bottonTap(
                              onPressed: () {
                                setState(() {
                                  curScreen = Home();
                                  curTap = 1;
                                });
                              },
                              text: "Favorite",
                              icon: Icons.favorite,
                              numcolors: 1,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: bottonTap(
                              onPressed: () {
                                setState(() {
                                  curScreen = Catigores();
                                  curTap = 0;
                                });
                              },
                              text: "Category",
                              icon: Icons.dashboard,
                              numcolors: 0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
//================end Home Page & nav bar ===============>
        ],
      ),
      //======================
    );
  }

//================Start Dark Mode Widget ===============>
  Widget DarkModeSwitch({var theme}) {
    return DayNightSwitcher(
      dayBackgroundColor: Colors.white.withOpacity(0.5),
      cloudsColor: ColoresDark.red,
      isDarkModeEnabled: themedark,
      onStateChanged: (val) {
        setState(() {
          if (themedark = val) {
            val = theme.setTheme(
              ThemeData(
                scaffoldBackgroundColor: ColoresDark.bal,
                colorScheme: ColorScheme.dark(),
                primaryColor: ColoresDark.bal,
                switchTheme: SwitchThemeData(
                    thumbColor: MaterialStateProperty.all(ColoresDark.bal),
                    trackColor: MaterialStateProperty.all(
                      ColoresDark.red,
                    )),
              ),
            );
            snakBar(
              text: 'Dark Mode',
              icon: Icons.nights_stay,
            );
          } else {
            val = theme.setTheme(
              ThemeData(
                scaffoldBackgroundColor: Colors.white,
                primaryColor: Colors.white,
                colorScheme: ColorScheme.light(),
                switchTheme: SwitchThemeData(
                  thumbColor: MaterialStateProperty.all(Colors.white),
                  trackColor: MaterialStateProperty.all(
                    ColoresDark.red,
                  ),
                ),
              ),
            );
            snakBar(
              text: 'white Mode',
              icon: Icons.nightlight_round,
            );
          }
        });
      },
    );
  }
  //================end Dark Mode Widget ===============>

  MaterialButton bottonTap(
      {Function onPressed, IconData icon, String text, int numcolors}) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: curTap == numcolors ? Colors.black : Colors.white,
          ),
          Text(
            text,
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
