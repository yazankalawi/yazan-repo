import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_color/flutter_color.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class sobhan extends StatefulWidget {
  const sobhan({Key? key}) : super(key: key);

  @override
  State<sobhan> createState() => _sobhanState();
}

class _sobhanState extends State<sobhan>    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _sizeAnimation;
  late Animation<double> _positionAnimation;

  double wi = 150 ;
  double hi = 150 ;
  double li = 150 ;

  @override

  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 2),
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
  @override

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: const Image(
            image: AssetImage('img/cover2.png'),
            filterQuality: FilterQuality.high,
            fit: BoxFit.cover,
            colorBlendMode: BlendMode.difference,
            color: Color.fromARGB(50, 122, 140, 140),
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
        floatingActionButton: SpeedDial(
          animatedIcon: AnimatedIcons.menu_home,
          backgroundColor: HexColor("#327A8C"),
          elevation: 20,
          childMargin: const EdgeInsets.symmetric(vertical: 15),
          overlayColor: Colors.black,
          children: [
            SpeedDialChild(label: "volume up", child: const Icon(Icons.volume_up)),
            SpeedDialChild(label: "text", child: const Icon(Icons.text_fields)),
            SpeedDialChild(label: "vibration", child: const Icon(Icons.vibration)),
            SpeedDialChild(label: "timer", child: const Icon(Icons.timer_sharp)),
            SpeedDialChild(
                label: "dark mode", child: const Icon(Icons.dark_mode_outlined)),
            SpeedDialChild(child: const Icon(Icons.ac_unit_rounded)),
            SpeedDialChild(
                label: "share", child: const Icon(Icons.ios_share_outlined)),
          ],
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: IconButton(
                        onPressed: () {
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.question,
                            animType: AnimType.rightSlide,
                            title: 'Dialog Title',
                            desc: 'Dialog description here.............',
                            btnCancelOnPress: () {},
                            btnOkOnPress: () {},
                          ).show();
                        },
                        icon: const Icon(
                          Icons.refresh,
                          size: 40,
                        ))),
                Container(
                    margin: const EdgeInsets.only(right: 20),
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.handshake_outlined,
                          size: 40,
                        )))
              ],
            ),
            Stack( children: [
              SizedBox(
                // color: Colors.red,
                height: 600,
                width: 600,
                child: Image(
                  image: const AssetImage("img/zkr1.png"),
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.fill,
                  color: HexColor("#EBCFB2"),
                ),
              ),
              // Container(color:Colors.red , margin: EdgeInsets.only(top: 500), child: Center(child: ElevatedButton(onPressed: (){}, child: Text("show")))),
              Container(
                margin: const EdgeInsets.only(top: 400),
                width: double.infinity,
                height: 200,
                child: InkWell(
                  onDoubleTap: () {
                    setState(() {
                      wi = 150 ;
                      hi = 150 ;
                    });
                  },
                    onTap: () {
                      setState(() {
                        wi = 300 ;
                        hi = 300 ;
                      });

                    },
                    child:
                        GestureDetector(
                          onTap: _moveBall,
                          child: AnimatedBuilder(
                            animation: _controller ,
                            builder: (context , val ) {
                              return Transform.translate(
                                offset: Offset(_positionAnimation.value, 0),
                                child: Container(
                                  width: _sizeAnimation.value,
                                  height: _sizeAnimation.value,
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              );
                            },
                          ),

                    )),
              ),
            ]),
            Container(
              alignment: Alignment.bottomLeft,
              margin: const EdgeInsets.only(top: 51, left: 10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 15,
                    backgroundColor: HexColor("#327A8C"),
                    shape: const CircleBorder(side: BorderSide.none),
                    minimumSize: const Size(56, 56)),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Center(child: Text("yazan")),
                          content: const Text("asfdghnjhdsadsfdfghdf",
                              textAlign: TextAlign.center),
                          backgroundColor: Colors.white.darker(20),
                          elevation: 10,
                          icon: const Icon(Icons.ac_unit_rounded),
                        );
                      });
                },
                child: const Text("show"),
              ),
            )
          ],
        ));
  }
}


// Transform.translate(
// offset: Offset(1, 0),
// child: AnimatedPositioned(
// curve: Curves.easeInToLinear,
// duration: const Duration(seconds: 1),
// child: Image.asset("img/ball1.png" , width: wi, height: hi,),
// ),
// ),
