import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  final String initialUrl;

  WebViewPage({Key? key, required this.initialUrl}) : super(key: key);

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {

  @override
  Widget build(BuildContext context) {
    WebViewController webViewController = WebViewController();

    return Scaffold(
        appBar: AppBar(),
        body: WebViewWidget(
            controller: webViewController
              ..loadRequest(Uri.parse(widget.initialUrl))));
  }
}