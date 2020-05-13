import 'package:admob_flutter/admob_flutter.dart';
import 'package:dreamsoccer_app/config/ads.dart';
import 'package:dreamsoccer_app/screen/home/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
