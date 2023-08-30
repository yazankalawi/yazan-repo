import 'package:flutter/material.dart';
import 'package:flutter_color/flutter_color.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  runApp(sobhan(savedThemeMode: savedThemeMode));
}

class sobhan extends StatefulWidget {
  final AdaptiveThemeMode? savedThemeMode;

  const sobhan({Key? key, this.savedThemeMode}) : super(key: key);

  @override
  State<sobhan> createState() => _sobhanState();
}

class _sobhanState extends State<sobhan> with SingleTickerProviderStateMixin {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
      saveCounter(_counter);
    });
  }

  late AnimationController _controller;
  late Animation<double> _sizeAnimation;
  late Animation<double> _positionAnimation;

  double wi = 150;

  double hi = 150;

  double li = 150;

  bool isMaterial = true;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _sizeAnimation = Tween<double>(begin: 100, end: 20).animate(_controller);
    _positionAnimation = Tween<double>(begin: 0, end: 200).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _moveBall() {
    if (_controller.status == AnimationStatus.completed) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
  }

  Color co = HexColor("#EBCFB2");

  bool _iconBool = false;

  final IconData _iconLight = Icons.wb_sunny;

  final IconData _iconDark = Icons.nights_stay;

  final ThemeData _lightThems = ThemeData(
    primarySwatch: Colors.red,
    brightness: Brightness.light,
  );

  final ThemeData _darkTheme = ThemeData(
    backgroundColor: HexColor("#327A8C"),
    primaryColor: HexColor("#327A8C"),
    brightness: Brightness.dark,
  );

  Future<void> saveCounter(int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('_counter', value);
  }

  double _angle = 0;

  double _fontSize = 20.0;
  bool showcounterbutton = true;

  bool showimg = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: _iconBool ? _darkTheme : _lightThems,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: HexColor("#527A7C"),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: const CustomAppBarShape(multi: 0.08),
            flexibleSpace: const Image(
              image: AssetImage('img/cover2.png'),
              filterQuality: FilterQuality.high,
              height: double.infinity,
              fit: BoxFit.cover,
              colorBlendMode: BlendMode.difference,
              //color: Color.fromARGB(50, 122, 140, 140),
            ),
            elevation: 20,
            actions: [
              Center(
                  child: Container(
                      margin: const EdgeInsets.only(right: 20),
                      child: const Text("ذِكرٌ و تسبيح",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w400,
                          )))),
              Container(
                  margin: const EdgeInsets.only(right: 10),
                  child: Image.asset(
                    "img/zkr3.png",
                    height: 200,
                    fit: BoxFit.fill,
                  )),
            ],
          ),
          body: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        margin: const EdgeInsets.only(left: 6),
                        child: IconButton(
                            icon: Icon(Icons.refresh,
                                size: 45, color: HexColor("#327A8C")),
                            onPressed: () {
                              showDialog(
                                  barrierColor:
                                      HexColor("#327A8C").withOpacity(0.4),
                                  context: context,
                                  builder: (context) {
                                    return Dialog(
                                        backgroundColor: Colors.transparent,
                                        insetPadding: const EdgeInsets.all(10),
                                        child: Stack(
                                          clipBehavior: Clip.none,
                                          alignment: Alignment.center,
                                          children: <Widget>[
                                            Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: 120,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  color: HexColor("#e0e1c2")),
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      20, 30, 20, 20),
                                              child: Text(
                                                  "هل تريد إعادة تصفير عداد الذكر",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18,
                                                      color:
                                                          HexColor("#327A8C")),
                                                  textAlign: TextAlign.center),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  top: 50),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    width: 130,
                                                    margin:
                                                        const EdgeInsets.only(
                                                            left: 40),
                                                    child: ElevatedButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                                primary: Colors
                                                                    .white,
                                                                elevation: 20,
                                                                fixedSize:
                                                                    const Size
                                                                            .fromHeight(
                                                                        10)),
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child: const Text(
                                                          "الغاء",
                                                          style: TextStyle(
                                                              fontSize: 20,
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        )),
                                                  ),
                                                  Container(
                                                    width: 130,
                                                    margin:
                                                        const EdgeInsets.only(
                                                            right: 40),
                                                    child: ElevatedButton(
                                                        style: ElevatedButton.styleFrom(
                                                            primary: HexColor(
                                                                "#327A8C"),
                                                            elevation: 20,
                                                            fixedSize: const Size
                                                                    .fromHeight(
                                                                10)),
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                          setState(() {
                                                            _counter = 0;
                                                          });
                                                        },
                                                        child: const Text(
                                                          "تأكيد",
                                                          style: TextStyle(
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        )),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ));
                                  });
                            })),
                    Container(
                        margin: const EdgeInsets.only(right: 20),
                        child: IconButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed("Homepage");
                            },
                            icon: Icon(
                              weight: 20,
                              color: HexColor("#327A8C"),
                              Icons.handshake_outlined,
                              size: 45,
                            )))
                  ],
                ),
              ),
              Stack(alignment: Alignment.center, children: [
                SizedBox(
                  // color: Colors.red,
                  height: MediaQuery.of(context).size.height * 0.73,
                  width: 600,
                  child: Image(
                    image: const AssetImage("img/zkr1.png"),
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.fill,
                    color: HexColor("#e0e1c2"),
                  ),
                ),
                if (showimg == true)
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 170,
                    margin: EdgeInsets.only(top: 450),
                    alignment: Alignment.center,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  _angle = _angle + 1;
                                  _counter++;
                                  setState(() {});
                                },
                                child: Transform.rotate(
                                  filterQuality: FilterQuality.high,
                                  angle: _angle,
                                  child: Image.asset(
                                    "img/ball1.png",
                                    repeat: ImageRepeat.repeatX,
                                    width: 200,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              )
                            ],
                          )
                        ]),
                  ),

                // Container(color:Colors.red , margin: EdgeInsets.only(top: 500), child: Center(child: ElevatedButton(onPressed: (){}, child: Text("show")))),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: HexColor("#327A8C"),
                  ),
                  margin: const EdgeInsets.only(
                    top: 450,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            style: BorderStyle.solid,
                            width: 3,
                            color: Colors.white)),
                    child: Column(
                      children: [
                        if (showcounterbutton == true)
                          IconButton(
                              style: const ButtonStyle(
                                elevation: MaterialStatePropertyAll(10),
                              ),
                              onPressed: _incrementCounter,
                              tooltip: 'Increment',
                              padding: const EdgeInsets.all(20),
                              iconSize: 50,
                              icon: const Icon(
                                Icons.add,
                                color: Colors.white,
                              )),
                      ],
                    ),
                  ),
                ),

                Container(
                  margin: const EdgeInsets.only(bottom: 100),
                  child: Text(
                    "سبحان الله",
                    style: TextStyle(
                        fontSize: _fontSize, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  width: 50,
                  height: 60,
                  margin: const EdgeInsets.only(top: 220),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: HexColor("#327A8C"),
                  ),
                  child: Center(
                    child: Text(
                      "$_counter",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
              ]),
              Container(
                margin: const EdgeInsets.only(top: 5),
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.bottomLeft,
                      margin: const EdgeInsets.only(left: 10),
                      child: SizedBox(
                        width: 100,
                        height: 40,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 15,
                              backgroundColor: HexColor("#327A8C"),
                              // shape: const CircleBorder(side: BorderSide.none),
                              minimumSize: const Size(56, 56)),
                          onPressed: () {
                            Alert1(context);
                          },
                          child: const Text(
                            "فضل الذكر",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Container(
                        decoration: BoxDecoration(
                            color: HexColor("#327A8C"),
                            borderRadius: BorderRadius.circular(100)),
                        margin: const EdgeInsets.only(right: 15),
                        child: IconButton(
                          onPressed: () {
                            showDialog(
                                barrierColor: Colors.transparent,
                                context: context,
                                builder: (context) {
                                  return Dialog(
                                      backgroundColor: Colors.transparent,
                                      insetPadding: const EdgeInsets.all(10),
                                      alignment: Alignment.bottomCenter,
                                      child: Container(
                                        child: Stack(
                                          clipBehavior: Clip.none,
                                          children: <Widget>[
                                            Container(
                                              width: double.infinity,
                                              height: 80,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  color: HexColor("#327A8C")),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  IconButton(
                                                      onPressed: () {},
                                                      icon: const Icon(
                                                        Icons.ios_share,
                                                        size: 30,
                                                        color: Colors.white,
                                                      )),
                                                  IconButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          _iconBool =
                                                              !_iconBool;
                                                        });
                                                      },
                                                      icon: Icon(
                                                        _iconBool
                                                            ? _iconDark
                                                            : _iconLight,
                                                        size: 30,
                                                        color: Colors.white,
                                                      )),
                                                  IconButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          showimg = true;
                                                          showcounterbutton =
                                                              false;
                                                        });
                                                      },
                                                      icon: const Icon(
                                                        Icons.control_point,
                                                        size: 30,
                                                        color: Colors.white,
                                                      )),
                                                  IconButton(
                                                      onPressed: () {
                                                        slider(context);
                                                      },
                                                      icon: const Icon(
                                                        Icons.text_fields,
                                                        size: 30,
                                                        color: Colors.white,
                                                      )),
                                                  IconButton(
                                                      isSelected: true,
                                                      color: Colors.yellow,
                                                      onPressed: () {
                                                        setState(() {
                                                          showcounterbutton =
                                                              true;
                                                          showimg = false;
                                                        });
                                                      },
                                                      icon: const Icon(
                                                        Icons.timer_outlined,
                                                        size: 30,
                                                      )),
                                                  IconButton(
                                                      onPressed: () {},
                                                      icon: const Icon(
                                                        Icons.vibration,
                                                        size: 30,
                                                        color: Colors.white,
                                                      )),
                                                  IconButton(
                                                      onPressed: () {},
                                                      icon: const Icon(
                                                        Icons.volume_up,
                                                        size: 30,
                                                        color: Colors.white,
                                                      )),
                                                ],
                                              ),
                                            ),
                                            Positioned(
                                                top: -55,
                                                left: 10,
                                                child: Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100),
                                                      color:
                                                          HexColor("#327A8C"),
                                                    ),
                                                    width: 40,
                                                    height: 40,
                                                    child: const CloseButton(
                                                        color: Colors.white)))
                                          ],
                                        ),
                                      ));
                                });
                          },
                          icon: const Icon(Icons.settings),
                          padding: const EdgeInsets.all(15),
                          color: Colors.white,
                          iconSize: 30,
                        ))
                  ],
                ),
              )
            ],
          ),
        ));
  }

  void slider(BuildContext context) {
     showDialog(
      barrierColor: Colors
          .transparent,
      context: context,
      builder: (BuildContext
              context) =>
          Container(
              margin: EdgeInsets
                  .only(
                      top:
                          580,
                      left:
                          40),
              child:
                  AlertDialog(
                content:
                    Container(
                  height:
                      10,
                  child:
                      Slider(
                    mouseCursor:
                        MaterialStateMouseCursor.textable,
                    activeColor:
                        HexColor("#327A8C"),
                    value:
                        _fontSize,
                    min:
                        10.0,
                    max:
                        40.0,
                    divisions:
                        4,
                    onChanged:
                        (double
                            value) {
                      setState(
                          () {
                        _fontSize =
                            value;
                      });
                    },
                  ),
                ),
              )),
    );
  }

  void Alert1(BuildContext context) {
    showDialog(
        barrierColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Dialog(
              backgroundColor: Colors.transparent,
              insetPadding: const EdgeInsets.all(10),
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: HexColor("#327A8C")),
                    padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
                    child: Column(
                      children: [
                        ClipPath(
                          child: Container(
                            height: 60,
                            width: 300,
                            color: HexColor("#e0e1c2"),
                            margin: EdgeInsets.only(bottom: 20, top: 10),
                          ),
                          clipper: TriangleClipper(),
                        ),
                        Text("You can make cool stuff!",
                            style: TextStyle(fontSize: 24),
                            textAlign: TextAlign.center),
                      ],
                    ),
                  ),
                  Positioned(
                      top: -60,
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: HexColor("#327A8C"),
                            border: Border.all(
                              style: BorderStyle.solid,
                              width: 5,
                              color: HexColor("#e0e1c2"),
                            ),
                          ),
                          width: 100,
                          height: 100,
                          child: const CloseButton(color: Colors.white)))
                ],
              ));
        });
  }
}

class TriangleClipper extends CustomClipper<Path> {
  double radius = 10, tw = 20, th = 10;

  @override
  Path getClip(Size size) {
    final path = Path();

    return path;
  }

  @override
  bool shouldReclip(TriangleClipper oldClipper) => false;
}

class CustomAppBarShape extends ContinuousRectangleBorder {
  final double multi;

  const CustomAppBarShape({this.multi = 0.1});

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    double height = rect.height;
    double width = rect.width;
    var path = Path();
    path.lineTo(0, height + width * multi);
    path.arcToPoint(
      Offset(width * multi, height),
      radius: Radius.circular(width * multi),
    );
    path.lineTo(width * (1 - multi), height);
    path.arcToPoint(
      Offset(width, height + width * multi),
      radius: Radius.circular(width * multi),
    );
    path.lineTo(width, 0);
    path.close();

    return path;
  }
}

// showDialog(
// context: context,
// builder: (BuildContext context) => Dialog(
//
// child : Container(
// height: 100,
// child: Slider(
// value: _fontSize,
// min: 10.0,
// max: 30.0,
// divisions: 4,
// onChanged: (double value) {
// setState(() {
// _fontSize = value;
// });
// },
// ),
// )));
