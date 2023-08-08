import 'package:flutter/material.dart';
import 'package:flutter_color/flutter_color.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class altasbeeh extends StatefulWidget {
  const altasbeeh({Key? key}) : super(key: key);

  @override
  State<altasbeeh> createState() => _altasbeehState();
}

class _altasbeehState extends State<altasbeeh> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: const Image(
          image: AssetImage('img/cover1.jpg'),
          fit: BoxFit.cover,
        ),
        backgroundColor: Colors.transparent,
        elevation: 20,
        actions: [
          Center(
              child: Container(
                  margin: EdgeInsets.only(right: 20),
                  child: Text("ذِكرٌ و تسبيح",
                      style: TextStyle(
                        fontSize: 22,
                      )))),
          Container(
              margin: EdgeInsets.only(right: 10),
              child: Image.asset(
                "img/mos.png",
                height: 200,
                fit: BoxFit.fill,
              )),
        ],
      ),
      body: Column(children: [
        Row(children: [
          Expanded(
              flex: 2,
              child: Container(
                margin: EdgeInsets.only(right: 50),
                  child: IconButton(
                onPressed: () {
                  print("fuck");
                },
                icon: Icon(
                  Icons.access_time_filled,
                  size: 50,
                ),
              ))),
          Expanded(
              flex: 2,
              child: Container(
                margin: EdgeInsets.only(left: 50),
                  child: IconButton(
                onPressed: () {
                  print("fuck");
                },
                icon: Icon(
                  Icons.access_time_filled,
                  size: 50,
                ),
              ))),
        ]),
        Stack(children: [

          Center(
            child: Stack(

              children:[
                Container(
                height: 700,
                child: Image.asset(
                  "img/zkr1.png",
                  fit: BoxFit.fitHeight,
                  color: HexColor("#EBCFB2"),
                ),
              ),
                Center(child: SingleChildScrollView( scrollDirection: Axis.horizontal,  padding: EdgeInsets.symmetric(horizontal: 70),child: Wrap( spacing: 50,children: [Container(color: Colors.red, width: 300, height: 300,margin: EdgeInsets.only(top: 190),),
                  Container(color: Colors.green, width: 300, height: 300,margin: EdgeInsets.only(top: 190),)])))
            ]),
          ),
          Container(
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.only(top: 500),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(30)),
              child: ElevatedButton(
                onPressed: () {
                  print("fuck");
                },
                child: Text("here"),
                style: ElevatedButton.styleFrom(
                  primary: HexColor("#327A8C"),
                    shape: CircleBorder(
                        side: BorderSide(
                      style: BorderStyle.none,
                    )),
                    minimumSize: Size(100, 100)),
              )),

        ]),
      ]),
    );
  }
}
