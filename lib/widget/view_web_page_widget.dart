import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ViewWebPageWidget extends StatefulWidget {
  String url;
  ViewWebPageWidget(this.url);

  @override
  _ViewWebPageWidgetState createState() => _ViewWebPageWidgetState();
}

class _ViewWebPageWidgetState extends State<ViewWebPageWidget> {
  bool _isLoadingWebPage = true;

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: [
      WebView(
        initialUrl: widget.url,
        onPageFinished: (url) {
          setState(() {
            this._isLoadingWebPage = false;
          });
        },
      ),
      _isLoadingWebPage ? CircularProgressIndicator() : Container(),
    ]);
  }
}
