import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../color.dart';
import 'ditalsWorld.dart';
import 'package:awesome_loader/awesome_loader.dart';

class Countries extends StatefulWidget {
  String id;
  String name;
  Countries({@required this.id, this.name});
  @override
  CountriesState createState() => CountriesState();
}

class CountriesState extends State<Countries> {
  Map _map;
  List country = [];
  List countries = [];
  bool favorite = false;

  Future<List> getCountry() async {
    final String response = await rootBundle.loadString('assets/api/data.json');
    final data = await json.decode(response);
    setState(() {
      _map = data['countries'];
      country = _map.values.toList();
    });

    for (var i = 0; i < country.length; i++) {
      var countryOfCon = country[i]['continent'];
      if (widget.id == countryOfCon) {
        countries.add(country[i]);
        searchList = countries;
      }
    }
    return countries;
  }

  @override
  void initState() {
    getCountry();
    super.initState();
  }

  bool isSearching = false;
  List searchList = [];

  void _filterSearch(value) {
    print(value);

    setState(() {
      searchList = countries
          .where((country) =>
              country['name'].toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  bool _folded = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        title: Text(
          widget.name,
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: ColoresDark.red,
        leading: Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8, left: 5, right: 5),
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
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 400),
              width: _folded ? 45 : MediaQuery.of(context).size.width / 1.2,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                color: Colors.white,
                boxShadow: kElevationToShadow[6],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                        padding: EdgeInsets.only(left: 16),
                        child: !_folded
                            ? TextField(
                                onChanged: (value) {
                                  _filterSearch(value);
                                },
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Search',
                                    helperStyle: TextStyle(
                                      color: ColoresDark.red,
                                    )),
                              )
                            : null),
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 400),
                    child: Material(
                      type: MaterialType.transparency,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(_folded ? 32 : 0),
                        topRight: Radius.circular(32),
                        bottomRight: Radius.circular(32),
                        bottomLeft: Radius.circular(_folded ? 32 : 0),
                      ),
                      child: InkWell(
                          onTap: () {
                            setState(() {
                              searchList = countries;
                              _folded = !_folded;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Icon(
                              _folded ? Icons.search : Icons.close,
                              color: ColoresDark.red,
                            ),
                          )),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
      body: searchList.length > 0
          ? ListView.builder(
              itemCount: searchList.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.grey.shade200),
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CountriesDetails(
                                      name: searchList[index]["name"],
                                      continent: searchList[index]["continent"],
                                      emoji: searchList[index]["emoji"],
                                      native: searchList[index]["native"],
                                      phone: searchList[index]["phone"],
                                      languages: searchList[index]["languages"],
                                    )));
                      },
                      trailing: IconButton(
                          icon: Icon(
                            Icons.favorite,
                            color: ColoresDark.red,
                          ),
                          onPressed: () {
                            setState(() {
                              favorite = true;
                              print('faaaav');
                            });
                          }),
                      title: Text(
                        searchList[index]["name"],
                        style: TextStyle(color: ColoresDark.bal),
                      ),
                      leading: Text(searchList[index]["emoji"]),
                    ),
                  ),
                );
              })
          : Center(
              child: AwesomeLoader(
                loaderType: AwesomeLoader.AwesomeLoader4,
                color: ColoresDark.red,
              ),
            ),
    );
  }
}
