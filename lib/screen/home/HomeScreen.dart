import 'package:dreamsoccer_app/config/ads.dart';
import 'package:dreamsoccer_app/main.dart';
import 'package:dreamsoccer_app/screen/drawer/DrawerScreen.dart';
import 'package:dreamsoccer_app/screen/home/ListStepScreen.dart';
import 'package:dreamsoccer_app/ultils/admob_ad_event.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart';

class HomeScreen extends StatefulWidget {
  static var ads = false;
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();
  bool isLoad = false;
  String applicationId;

  @override
  void initState() {
    super.initState();
    getAppID();
    FirebaseAdMob.instance.initialize(appId: appId);
    createBannerAd()
      ..load()
      ..show(
        anchorType: AnchorType.bottom,
      );
  }

  BannerAd createBannerAd() {
    return BannerAd(
      adUnitId: bannerId,
      size: AdSize.largeBanner,
      listener: (MobileAdEvent event) {
        print("BannerAd event $event");
        switch (event) {
          case MobileAdEvent.failedToLoad:
            HomeScreen.ads = false;
            break;
          case MobileAdEvent.loaded:
            HomeScreen.ads = true;
            break;
          default:
            HomeScreen.ads = false;
            break;
        }
      },
    );
  }

  getAppID() async {
    applicationId = await MyApp.platform.invokeMethod("getAppId");
    setState(() {
      applicationId;
    });
  }

  void getAd() async {
    clickAdmob(context, () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => ListStepScreen()));
    }, 5);
  }

  Future<void> _shareText() async {
    try {
      Share.text('Dream League Soccer 2k20',
          'Dream League Soccer 2k20: https://play.google.com/store/apps/details?id=${applicationId}', 'text/plain');
    } catch (e) {
      print('error: $e');
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      drawer: DrawerScreen(),
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        leading: IconButton(
            icon: Icon(
              Icons.list,
              color: Colors.white,
            ),
            iconSize: 30,
            onPressed: () {
              _scaffoldKey.currentState.openDrawer();
            }),
        title: Text(
          "Guide for dream league 2020",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: width * 0.1, right: width * 0.1),
                    height: height * 0.25,
                    width: width * 0.8,
                    child: Image.asset("assets/images/bgbanner.jpg", fit: BoxFit.fill),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () async {
                      getAd();
                    },
                    child: Container(
                      height: height * 0.08,
                      width: width * 0.6,
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: Center(
                        child: Text("START", style: TextStyle(color: Colors.white, fontSize: 24)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () async {
                      await _shareText();
                    },
                    child: Container(
                      height: height * 0.08,
                      width: width * 0.6,
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: Center(
                        child: Text("SHARE", style: TextStyle(color: Colors.white, fontSize: 24)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
