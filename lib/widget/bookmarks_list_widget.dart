import 'package:first_project/model/bookmark.dart';
import 'package:flutter/material.dart';

import 'bookmark_list_item_widget.dart';

class BookmarksListWidget extends StatelessWidget {
  final List<Bookmark> bookmarksList;

  BookmarksListWidget(this.bookmarksList);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return BookmarkListItemWidget(bookmarksList[index]);
      },
      itemCount: bookmarksList.length,
    );
  }
}
