import 'package:flutter/material.dart';
import 'package:untitled2/sobhan.dart';
import 'Homepage.dart';
import 'night.dart';
import 'sobhan.dart';
import 'package:flutter_color/flutter_color.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main (){
  runApp ( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);

  bool _iconBool = false ;

  IconData _iconLight = Icons.wb_sunny ;
  IconData _iconDark = Icons.nights_stay ;

  ThemeData _lightThems = ThemeData(
    primarySwatch: Colors.red,
    brightness: Brightness.light ,
  ) ;

  final ThemeData _darkTheme = ThemeData(
    backgroundColor: HexColor("#327A8C"),
    primaryColor:  HexColor("#327A8C"),
    brightness: Brightness.dark ,
  ) ;



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      theme: _iconBool ? _darkTheme : _lightThems,
      debugShowCheckedModeBanner: false,
      home: Homepage() ,
      routes :{
        "night" : (context) => night() ,
        "sobhan" : (context) => sobhan() ,
        "Homepage" : (context) => Homepage() ,
      },

    );
  }
}
