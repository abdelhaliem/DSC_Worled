import 'dart:core';
import 'package:flutter/material.dart';
import 'package:travel/screens/countries.dart';

import '../color.dart';
import 'countries.dart';
//====================

class Catigores extends StatefulWidget {
  @override
  _CatigoresState createState() => _CatigoresState();
}

class _CatigoresState extends State<Catigores> {
  List<String> keycontinents = [
    "AF",
    "AN",
    "AS",
    "EU",
    "NA",
    "OC",
    "SA",
  ];
  List<String> continents = [
    "Africa",
    "Antarctica",
    "Asia",
    "Europe",
    "North America",
    "Oceania",
    "South America"
  ];
//int count=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            // SizedBox(
            //   height: 30,
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  child: maps(
                    "Europa",
                    "assets/images/eu.jpg",
                  ),
                  onTap: () {
                    var id = keycontinents[3];
                    var name = continents[3];
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Countries(id: id, name: name),
                      ),
                    );
                  },
                ),
                InkWell(
                  child: maps("Aferica", "assets/images/af.jpg"),
                  onTap: () {
                    var id = keycontinents[0];
                    var name = continents[0];
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Countries(id: id, name: name),
                      ),
                    );
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  child: maps("Austrillia", "assets/images/as.jpg"),
                  onTap: () {
                    var id = keycontinents[5];
                    var name = continents[5];
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Countries(id: id, name: name),
                      ),
                    );
                  },
                ),
                InkWell(
                  child: maps("North America", "assets/images/am2.jpg"),
                  onTap: () {
                    var id = keycontinents[4];
                    var name = continents[4];
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Countries(id: id, name: name),
                      ),
                    );
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  child: maps("South America", "assets/images/am1.jpg"),
                  onTap: () {
                    var id = keycontinents[6];
                    var name = continents[6];
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Countries(id: id, name: name),
                      ),
                    );
                  },
                ),
                InkWell(
                  child: maps("Asia", "assets/images/as.jpg"),
                  onTap: () {
                    var id = keycontinents[2];
                    var name = continents[2];
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Countries(id: id, name: name),
                      ),
                    );
                  },
                ),
              ],
            ),
            InkWell(
              child: maps("Antarcatica", 'assets/images/an.jpg'),
              onTap: () {
                var id = keycontinents[1];
                var name = continents[1];
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Countries(id: id, name: name),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    ));
  }

  Widget maps(
    txt,
    String image,
  ) {
    return Card(
      color: ColoresDark.red,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(13),
      ),
      child: Column(
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            width: 140,
            height: 110,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              color: ColoresDark.red,
              image:
                  DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              txt,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
