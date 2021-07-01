import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:travel/color.dart';

class CountriesDetails extends StatefulWidget {
  String name;
  String native;
  String phone;
  String emoji;
  String continent;
  List languages;

  CountriesDetails({
    @required this.name,
    @required this.continent,
    @required this.native,
    @required this.phone,
    @required this.emoji,
    @required this.languages,
  });

  @override
  CountriesDdetailsState createState() => CountriesDdetailsState();
}

class CountriesDdetailsState extends State<CountriesDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.name,
            style: TextStyle(color: Colors.white),
          ),
          toolbarHeight: 60,
          leading: Padding(
            padding: const EdgeInsets.only(
              top: 8,
              bottom: 8,
              left: 5,
              right: 5,
            ),
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                color: Colors.white,
                boxShadow: kElevationToShadow[6],
              ),
              child: InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(
                    Icons.arrow_back_ios_rounded,
                    color: ColoresDark.red,
                  )),
            ),
          ),
          centerTitle: true,
          backgroundColor: ColoresDark.red,
        ),
        body: ListView(children: [
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 4,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white,
                          spreadRadius: 2,
                        )
                      ],
                      image: DecorationImage(
                        image: AssetImage('assets/images/back.jpg'),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 2,
                  margin:
                      EdgeInsets.only(bottom: 50, left: 10, right: 10, top: 10),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: ColoresDark.red,
                        offset: Offset(3, 3),
                        //blurRadius: 2,
                        spreadRadius: 2,
                      )
                    ],
                    borderRadius: BorderRadius.circular(50),
                    color: ColoresDark.bal,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      CircleAvatar(
                        child: Text(
                          widget.emoji,
                          style: TextStyle(fontSize: 40),
                        ),
                        backgroundColor: Colors.white,
                        radius: 50,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Data Country',
                        style: TextStyle(
                          color: ColoresDark.red,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Divider(
                        color: Colors.white,
                        thickness: 2,
                        endIndent: 90,
                        indent: 90,
                      ),
                      ListTitle(
                        name: widget.name,
                        title: "Name : ",
                      ),
                      //Divider(),
                      ListTitle(
                        name: widget.native,
                        title: "native : ",
                      ),
                      // Divider(),
                      ListTitle(
                        name: widget.phone,
                        title: "phone : ",
                      ),
                      //Divider(),
                      ListTitle(
                        name: widget.continent,
                        title: "continent : ",
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ]));
  }

  Widget ListTitle({String name, String title}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.grey.shade900,
      ),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            name,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: ColoresDark.red,
            ),
          ),
        ],
      ),
    );
  }
}
