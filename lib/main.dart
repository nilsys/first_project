import 'package:first_project/page/bookmarks_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyBookmarksApp());

class MyBookmarksApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: BookmarksPage());
  }
}
