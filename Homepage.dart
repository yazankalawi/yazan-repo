import 'package:flutter/material.dart';
import 'package:flutter_color/flutter_color.dart';
import 'package:untitled2/sobhan.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool notify = false;

  List note = [
    {
      "zkr": "سبحان الله",
      'index': 1,
    },
    {
      "zkr": "الحمدلله",
      "index": 2,
    },
    {"zkr": "لا إله إلا الله", 'index': 3, "page1": "sobhan"},
    {"zkr": "استغفر الله", "index": 4},
    {"zkr": "الله أكبر", "index": 5},
    {"zkr": "أستغفر الله العظيم و أتوب إليه", "index": 6},
    {"zkr": "سبحان الله و بحمده", "index": 7},
    {"zkr": "اللهم صل على سيدنا محمد", "index": 8},
    {"zkr": "لا حول ولا قوة إلا بالله", "index": 9},
    {
      "zkr":
          "لا إله إلا الله وحده لا شريك له له الملك و له الحمد وهو على كل شيء قدير",
      "index": 10
    },
    {"zkr": "حسبنا الله و نهم الوكيل", "index": 11},
    {"zkr": "لا إله إلا أنت سبحانك إن كنا من الظالمين", "index": 12},
    {"zkr": "سبحان الله العظيم سبحان الله و بحمده", "index": 13},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: const Image(
          image: AssetImage('img/cover2.png'),
          filterQuality: FilterQuality.high,
          fit: BoxFit.cover,
          colorBlendMode: BlendMode.difference,
          color: Color.fromARGB(50 ,122 ,140 , 140) ,

        ),
        backgroundColor: HexColor("#327A8C"),
        elevation: 10,
        leading: IconButton(
            onPressed: () {
              showModalBottomSheet(
                  elevation: 30,
                  backgroundColor: HexColor("#EAEAEA"),
                  context: context,
                  builder: (BuildContext) {
                    return Container(
                      margin: const EdgeInsets.only(top: 40),
                      child: Column(
                        children: [
                          Text(
                            "الإعدادات",
                            style: TextStyle(
                                fontSize: 34,
                                fontWeight: FontWeight.w600,
                                color: HexColor("#6897BB")),
                          ),
                          ListTile(
                            title: const Text(
                              "التنبيهات",
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: Colors.black26,
                              ),
                            ),
                            leading: Switch(
                                activeColor: HexColor("#20B2AA"),
                                activeTrackColor: Colors.grey,
                                value: notify,
                                onChanged: (val) {
                                  setState(() {
                                    val = notify;
                                  });
                                }),
                          ),
                          ListTile(
                            title: Text(
                              "قيم التطبيق",
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                  color: HexColor("#6897BB")),
                            ),
                            leading: Icon(
                              color: HexColor("#6897BB"),
                              Icons.rate_review,
                              size: 36,
                            ),
                            onTap: () {},
                          ),
                          ListTile(
                            title: Text(
                              "شارك التطبيق",
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                  color: HexColor("#6897BB"),
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold),
                            ),
                            leading: Icon(
                              Icons.share,
                              size: 36,
                              color: HexColor("#6897BB"),
                            ),
                            onTap: () {},
                          ),
                          ListTile(
                            title: Text(
                              "تواصل معنا",
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                  color: HexColor("#6897BB"),
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold),
                            ),
                            leading: Icon(
                              color: HexColor("#6897BB"),
                              Icons.add_ic_call_outlined,
                              size: 36,
                            ),
                            onTap: () {},
                          ),
                        ],
                      ),
                    );
                  });
            },
            icon: const Icon(
              Icons.menu,
              size: 40,
            )),
        actions: [
          Center(
              child: Container(
                  margin: const EdgeInsets.only(right: 20),
                  child: const Text("ذِكرٌ و تسبيح",
                      style: TextStyle(
                        fontSize: 22,
                      )))),
          Container(
              margin: const EdgeInsets.only(right: 10),
              child: Image.asset(filterQuality: FilterQuality.high,
                "img/zkr3.png",
              )),
        ],
      ),
      body: Center(
        child: Stack(children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40))),
          ),
          Center(
              child: Container(
                  margin: const EdgeInsets.only(bottom: 300),
                  child: Image(
                    image: AssetImage("img/zkr1.png"),
                    color: HexColor("#EBCFB2"),
                  ))),
          Center(
            child: Stack(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Center(
                      child: Container(
                        padding: EdgeInsets.all(20),
                        margin: const EdgeInsets.only(bottom: 210),
                        width: 350,
                        height: 350,
                        decoration: BoxDecoration(
                            color: HexColor("#EBCFB2"),
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(30),
                                topLeft: Radius.circular(30))),
                        child: ListView.builder(
                           physics: BouncingScrollPhysics(),
                          itemBuilder: (context, i) {
                            return Container(

                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: HexColor("#327A8C")),
                              margin: const EdgeInsets.all(8),
                              child: MaterialButton(
                                onPressed: () async {
                                  // for (var i = 0; i <= note.length; i++) {
                                  if (i == 0) {
                                    await {
                                      //Navigator.of(context).pushNamed("$note[i][page1]")
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => sobhan(),
                                        ),
                                      )
                                    };
                                  } else if (i == 1) {
                                    Navigator.of(context)
                                        .pushNamed("altasbeeh");
                                  }
                                },
                                child: ListTile(
                                  title: Text(
                                    "${note[i]['zkr']}",
                                    style: TextStyle(
                                        color: HexColor("#ffffff"),
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                    textDirection: TextDirection.rtl,
                                  ),
                                ),
                              ),
                            );
                          },
                          itemCount: note.length,
                        ),
                      ),
                    )
                  ],
                ),
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(top: 450),
                    width: 350,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                        color: HexColor("#EBCFB2"),
                        borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(30),
                            bottomLeft: Radius.circular(30))),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: GridView(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisExtent: 130,
                                  mainAxisSpacing: 20),
                          physics:
                              const NeverScrollableScrollPhysics(parent: null),
                          children: [
                            Container(
                              margin: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: HexColor("#327A8C"),
                              ),
                              child: MaterialButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pushNamed("altasbeeh");
                                  },
                                  child: Container(
                                      height:
                                          MediaQuery.of(context).size.height,
                                      margin: const EdgeInsets.only(top: 20),
                                      child: Column(
                                        children: const [
                                          Icon(
                                            Icons.nights_stay_outlined,
                                            size: 40,
                                            color: Colors.white,
                                          ),
                                          Text(
                                            "أذكار المساء",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          )
                                        ],
                                      ))),
                            ),
                            Container(
                              margin: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: HexColor("#327A8C"),
                              ),
                              child: MaterialButton(
                                  onPressed: () {},
                                  child: Container(
                                      height:
                                          MediaQuery.of(context).size.height,
                                      margin: const EdgeInsets.only(top: 20),
                                      child: Column(
                                        children: const [
                                          Icon(
                                            Icons.wb_sunny_outlined,
                                            size: 40,
                                            color: Colors.white,
                                          ),
                                          Text(
                                            "أذكار الصباح",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          )
                                        ],
                                      ))),
                            ),
                            Container(
                              margin: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: HexColor("#327A8C"),
                              ),
                              child: MaterialButton(
                                  onPressed: () {},
                                  child: Container(
                                      height:
                                          MediaQuery.of(context).size.height,
                                      margin: const EdgeInsets.only(top: 20),
                                      child: Column(
                                        children: const [
                                          Icon(
                                            Icons.bed_outlined,
                                            size: 40,
                                            color: Colors.white,
                                          ),
                                          Text(
                                            "أذكار النوم",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          )
                                        ],
                                      ))),
                            ),
                            Container(
                              margin: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: HexColor("#327A8C"),
                              ),
                              child: MaterialButton(
                                  onPressed: () {},
                                  child: Container(
                                      height:
                                          MediaQuery.of(context).size.height,
                                      margin: const EdgeInsets.only(top: 20),
                                      child: Column(
                                        children: const [
                                          Icon(
                                            Icons.waving_hand_outlined,
                                            size: 40,
                                            color: Colors.white,
                                          ),
                                          Text(
                                            "أذكار بعد الصلاة",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          )
                                        ],
                                      ))),
                            ),
                          ]),
                    ),
                  ),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
