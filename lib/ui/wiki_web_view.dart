import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WikiWebView extends StatelessWidget {
  final String strTitle;
  final key = UniqueKey();

  WikiWebView(this.strTitle);

  final String userAgents =
      "Mozilla/5.0 (Linux; <Android Version>; <Build Tag etc.>) AppleWebKit/<WebKit Rev> (KHTML, like Gecko) Chrome/<Chrome Rev> Mobile Safari/<WebKit Rev>";

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          Get.back();
          return Future.value(false);
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text("Search Details ",
                style: Theme.of(context).textTheme.headline5),
            backgroundColor: Colors.redAccent,
            leading: IconButton(
                icon: Icon(Icons.arrow_back),color: Colors.black,
                onPressed: () {
                  Get.back();
                }),
          ),
          body: Container(
            child: WebView(
              key: key,
              javascriptMode: JavascriptMode.unrestricted,
              userAgent: userAgents,
              initialUrl: "https://en.wikipedia.org/wiki/$strTitle",
              gestureNavigationEnabled: true,
            ),
          ),
        ));
  }
}
