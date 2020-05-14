import 'dart:convert';
import 'package:dreamsoccer_app/screen/home/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ListStepDetail extends StatefulWidget {
  String title;
  String namefile;
  ListStepDetail({Key key, this.title, this.namefile}) : super(key: key);

  @override
  _ListStepDetailState createState() => _ListStepDetailState();
}

class _ListStepDetailState extends State<ListStepDetail> {
  WebViewController _controller;
  _loadHtmlFromAssets() async {
    String fileText = await rootBundle.loadString(widget.namefile);
    _controller
        .loadUrl(Uri.dataFromString(fileText, mimeType: 'text/html', encoding: Encoding.getByName('utf-8')).toString());
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar:
          AppBar(backgroundColor: Colors.blueGrey, title: Text(widget.title, style: TextStyle(color: Colors.white))),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                height: HomeScreen.ads ? height - 190 : height - 90,
                width: double.infinity,
                color: Colors.white,
                child: Center(
                  child: WebView(
                    initialUrl: '',
                    onWebViewCreated: (WebViewController webViewController) {
                      _controller = webViewController;
                      _loadHtmlFromAssets();
                    },
                  ),
                ),
              ),
            ),
          ),
          HomeScreen.ads
              ? Container(
                  height: 100,
                  color: Colors.white,
                )
              : Container(
                  color: Colors.white,
                )
        ],
      ),
    );
  }
}
