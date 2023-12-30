import 'package:flutter/material.dart';
import 'package:storeshop/routes/Login.dart';
import 'package:storeshop/routes/handel.dart';
import 'package:get/get.dart';
import 'package:storeshop/routes/home.dart';
void main(){
runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Handel(),

      routes: {
        "/home" :(context) =>  HomePage(),
         "/log" :(context) => LoginPage(),
      },
    );
  } 
}
