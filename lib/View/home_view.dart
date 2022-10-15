import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
  List<dynamic> finalData = [];

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
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Stack"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        height: Get.height * 0.8,
        decoration: BoxDecoration(color: Colors.black),
        width: double.infinity,
        child: Column(
          children: [
            Stack(
              children: [
                Positioned(
                    top: 50,
                    left: 20,
                    child: Container(
                      child: Text("first",style: TextStyle(color: Colors.red),),
                    )),
                ///
                Positioned(
                    top: 100,
                    left: 30,
                    child: Container(
                      child: Text("two"),
                    )),
                Positioned(
                    top: 150,
                    left: 40,
                    child: Container(
                      child: Text("three"),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
