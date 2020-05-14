import 'dart:convert';

import 'package:dreamsoccerclone/screen/home/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DrawerDetail extends StatefulWidget {
  String title;
  String namefile;
  DrawerDetail({Key key, this.title, this.namefile}) : super(key: key);

  @override
  _DrawerDetailState createState() => _DrawerDetailState();
}

class _DrawerDetailState extends State<DrawerDetail> {
  WebViewController _controller;
  _loadHtmlFromAssets() async {
    String fileText = await rootBundle.loadString(widget.namefile);
    _controller.loadUrl(Uri.dataFromString(fileText,
            mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString());
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(widget.title, style: TextStyle(color: Colors.white)),
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.only(bottom: HomeScreen.ads ? 100 : 0),
        child: WebView(
          initialUrl: '',
          onWebViewCreated: (WebViewController webViewController) {
            _controller = webViewController;
            _loadHtmlFromAssets();
          },
        ),
      ),
    );
  }
}
