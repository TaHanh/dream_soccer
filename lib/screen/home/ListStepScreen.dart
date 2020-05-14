import 'package:dreamsoccerclone/ultils/admob_ad_event.dart';
import 'package:flutter/material.dart';

import 'ListStepDetail.dart';

class ListStepScreen extends StatefulWidget {
  ListStepScreen({Key key}) : super(key: key);

  @override
  _ListStepScreenState createState() => _ListStepScreenState();
}

class _ListStepScreenState extends State<ListStepScreen> {
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();
  @override
  void initState() {
    super.initState();
  }

  void getAd(title, namefile) async {
    clickAdmob(context, () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ListStepDetail(
                    title: title,
                    namefile: namefile,
                  )));
    }, 5);
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(
          "Guide for dream league 2020",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: width * 0.1, right: width * 0.1),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    getAd("STEP 1-- About Dream League Games",
                        "files/step1.html");
                  },
                  child: Container(
                    height: height * 0.1,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Center(
                      child: Text("STEP 1-- About Dream League Games",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    getAd("STEP 2-- Dream League", "files/step2.html");
                  },
                  child: Container(
                    height: height * 0.1,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Center(
                      child: Text("STEP 2-- Dream League",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    getAd("STEP 3-- Dream League", "files/step3.html");
                  },
                  child: Container(
                    height: height * 0.1,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Center(
                      child: Text("STEP 3-- Dream League",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    getAd("STEP 4-- Dream League", "files/step4.html");
                  },
                  child: Container(
                    height: height * 0.1,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Center(
                      child: Text("STEP 4-- Dream League",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    getAd("STEP 5-- Dream League", "files/step5.html");
                  },
                  child: Container(
                    height: height * 0.1,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Center(
                      child: Text("STEP 5-- Dream League",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
