import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:task/Provider/home_services.dart';
class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {

  bool _isLoading = false;
  String? _selectedLocation;
   List<dynamic> finalData = [] ;
   List<dynamic> finalDescription = [];
  HomeProvider homeProvider = HomeProvider();
  @override
  void initState() {
    super.initState();
    homeProvider.getUserData();
    homeProvider.finalDescriptionMethod();
    _selectedLocation = homeProvider.category;
    finalData = homeProvider.finalData;
    finalDescription = homeProvider.finalDescriptionData;

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 150,
        title: Column(
            children: const <Widget>[
              Text('Find Your'),
              Text('Jokes', style: TextStyle(fontWeight: FontWeight.bold),),
              SizedBox(
                  child: TextField(
                    decoration: InputDecoration(border: InputBorder.none,
                        hintText: 'Search',
                        fillColor: Colors.white,
                        filled: true,
                        prefixIcon: Icon(Icons.search)),
                  )
              )

            ]
        ),
        backgroundColor: Colors.blue,
      ),
      body: Column(children: <Widget>[
        Stack(children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * .4,
          ),
          Container(
            height: MediaQuery.of(context).size.height * .14,
            color: Colors.pink[100],
          ),
          Positioned(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Temples",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Positioned(
            top: 95,
            child: Padding(
              padding: const EdgeInsets.only(left: 4, right: 4),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        height: 50.0,
                        width: MediaQuery.of(context).size.width * .97,
                        color: Colors.transparent,
                        child: Container(
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft:  Radius.circular(40.0),
                                    bottomLeft:  Radius.circular(40.0),
                                    bottomRight:  Radius.circular(40.0),
                                    topRight:  Radius.circular(40.0))),
                            child:  Center(
                              child: Container(
                                  margin: EdgeInsets.only(
                                      left:
                                      MediaQuery.of(context).size.width *
                                          .4),
                                  child: const Text(
                                    "Favourite",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold),
                                  )),
                            )),
                      ),
                      Container(
                        height: 50.0,
                        width: MediaQuery.of(context).size.width * .5,
                        color: Colors.transparent,
                        child:  Container(
                            decoration:  BoxDecoration(
                                gradient: LinearGradient(
                                  // Where the linear gradient begins and ends
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  // Add one stop for each color. Stops should increase from 0 to 1
                                  stops: [0.1, 0.5, 0.7, 0.9],
                                  colors: [
                                    // Colors are easy thanks to Flutter's Colors class.
                                    Colors.pink.withOpacity(0.8),
                                    Colors.pink.withOpacity(0.7),
                                    Colors.red.withOpacity(0.6),
                                    Colors.red.withOpacity(0.4),

                                  ],
                                ),
                                color: Colors.redAccent[100],
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(40.0),
                                    bottomLeft:  Radius.circular(40.0),
                                    bottomRight:  Radius.circular(40.0),
                                    topRight:  Radius.circular(40.0))),
                            child: const Center(
                              child:  Text(
                                "ALL",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ]),
        ListView.builder(
            primary: false,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: 2,
            itemBuilder: (context, index) {
              return Text("my widget card will add here");
            })
      ]),
    );
  }
}

