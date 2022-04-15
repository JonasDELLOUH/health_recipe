import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../helpers/widget_functions.dart';

class WebRecipeView extends StatefulWidget {
  final String url;
  const WebRecipeView({Key? key, required this.url}) : super(key: key);

  @override
  _WebRecipeViewState createState() => _WebRecipeViewState();
}

class _WebRecipeViewState extends State<WebRecipeView> {

  late String finalUrl;
  final Completer<WebViewController> _controller = Completer<WebViewController>();

  @override
  void initState() {
    if(widget.url.contains("http://")){
      finalUrl = widget.url.replaceAll("http://", "https://");
    } else {
      finalUrl = widget.url;
    }
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appTitle(context),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.blue,
            ),
          )
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height - 100,
        width: MediaQuery.of(context).size.width,
        child: WebView(
          initialUrl: widget.url,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
        ),
      ),
    );
  }
}
