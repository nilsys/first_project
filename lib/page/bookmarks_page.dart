import 'package:first_project/model/bookmark.dart';
import 'package:first_project/util/navigation_util.dart';
import 'package:first_project/widget/bookmarks_grid_widget.dart';
import 'package:first_project/widget/bookmarks_list_widget.dart';
import 'package:flutter/material.dart';

class BookmarksPage extends StatefulWidget {
  @override
  _BookmarksPageState createState() => _BookmarksPageState();
}

class _BookmarksPageState extends State<BookmarksPage> {
  bool isGridMode = false;
  List<Bookmark> bookmarksList = [
    Bookmark("google", "https://www.google.com"),
    Bookmark("flutter", "https://flutter.dev"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Bookmarks"),
        actions: [
          IconButton(
            icon: isGridMode ? Icon(Icons.list) : Icon(Icons.grid_on),
            onPressed: (){
              setState(() {
                isGridMode = !isGridMode;
              });
            },
          )
        ],
      ),
      body: isGridMode ? BookmarksGridWidget(bookmarksList) : BookmarksListWidget(bookmarksList),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.add),
        onPressed: () => onAddButtonPressed(context),
        label: Text("Add"),
      ),
    );
  }

  void onAddButtonPressed(BuildContext context) async {
    final result = await navigateToAddBookmarkPage(context);
    if (result != null && result is Bookmark) {
      setState(() {
        bookmarksList.add(result);
      });
    }
  }
}
