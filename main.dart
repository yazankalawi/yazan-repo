import 'package:flutter/material.dart';
import 'package:untitled2/sobhan.dart';
import 'Homepage.dart';
import 'altasbeeh.dart';
import 'sobhan.dart';
void main (){
  runApp (const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage() ,
      routes :{
        "altasbeeh" : (context) => altasbeeh() ,
        "sobhan" : (context) => sobhan() ,
      },
    );
  }
}
