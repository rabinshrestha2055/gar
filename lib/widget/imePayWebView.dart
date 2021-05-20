import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ImePayWebView extends StatefulWidget {
  final html;
  const ImePayWebView({Key key, this.html}) : super(key: key);

  @override
  _ImePayWebViewState createState() => _ImePayWebViewState();
}

class _ImePayWebViewState extends State<ImePayWebView> {
  WebViewController _webViewController;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: WebView(
              initialUrl: '',
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController webViewController) {
                _webViewController = webViewController;
                _loadHtmlFromAssest();
              })),
    );
  }

  _loadHtmlFromAssest() {
    _webViewController.loadUrl(Uri.dataFromString(widget.html.toString(),
            mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString());
  }
}
