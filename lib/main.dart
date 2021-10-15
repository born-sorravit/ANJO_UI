import 'package:anjo_ui/views/firstpage.dart';
import 'package:anjo_ui/views/test.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        fontFamily: 'Prompt'
      ),
      home: FirstPage(),
      //  getPages: [
      //   GetPage(name: '/', page: () => PageOne()),
      // ],
    
    );
  }
}
