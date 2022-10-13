import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'Provider/home_services.dart';
import 'View/home_view.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeProvider()),
      ],
      child: Builder(builder: (BuildContext context) {

        return GetMaterialApp(

          debugShowCheckedModeBanner: false,
          title: 'Flutter Provider',
          theme: ThemeData(
              brightness: Brightness.light
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
          ),
          home:  MyHomePage(title: 'Home',),
        );
      }),
    );
  }
}
