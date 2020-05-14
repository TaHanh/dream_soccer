import 'package:admob_flutter/admob_flutter.dart';
import 'package:dreamsoccerclone/screen/home/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'config/ads.dart';

// void main() => runApp(MyApp());
void main() {
  Admob.initialize(appId);
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const platform = const MethodChannel('my_module');
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dream Soccer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: getScreen(),
      debugShowCheckedModeBanner: false,
    );
  }

  getScreen() {
    platform.invokeMethod("getBannerId").then((value) {
      bannerId = value;
    });
    platform.invokeMethod("getInterId").then((value) {
      interUnitId = value;
    });
    return HomeScreen();
  }
}
