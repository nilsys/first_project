import 'package:first_project/model/bookmark.dart';
import 'package:first_project/widget/view_web_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ViewBookmarkPage extends StatelessWidget {
  Bookmark _bookmark;

  ViewBookmarkPage(this._bookmark);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_bookmark.title),
      ),
      body: ViewWebPageWidget(_bookmark.link),
    );
  }
}
