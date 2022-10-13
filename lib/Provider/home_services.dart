import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class HomeProvider with ChangeNotifier {
  // double _value = 1.0;
  // double get value => _value;
  String _category = "";

  String get category => _category;
  List<dynamic> _description = [];

  List<dynamic> get finalDescriptionData => _description;
  var _data = [];

  List<dynamic> get finalData => _data;

  Future<void> getUserData() async {
    final response =
        // https://api.chucknorris.io/jokes/categories
        await http
            .get(Uri.parse("https://api.chucknorris.io/jokes/categories"));
    if (response.statusCode == 200) {
      _data = jsonDecode(response.body);
      notifyListeners();
      if (kDebugMode) {
        print("this is our data" + _data.toString());
      }
    }
  }

  Future<void> finalDescriptionMethod() async {
    final response = await http.get(
      Uri.parse("https://api.chucknorris.io/jokes/random"),
    );
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      // _description = result["value"];
      _description = result;
      notifyListeners();
    }
  }
}
