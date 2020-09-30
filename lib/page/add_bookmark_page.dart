import 'package:first_project/model/bookmark.dart';
import 'package:flutter/material.dart';

class AddBookmarkPage extends StatefulWidget {
  @override
  _AddBookmarkPageState createState() => _AddBookmarkPageState();
}

class _AddBookmarkPageState extends State<AddBookmarkPage> {
  final _titleTextController = TextEditingController();

  final _linkTextController = TextEditingController();

  final _linkFocusNode = FocusNode();

  @override
  void dispose() {
    _titleTextController.dispose();
    _linkTextController.dispose();
    _linkFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add a new bookmark"),
      ),
      floatingActionButton: Builder(
        builder: (BuildContext context) => FloatingActionButton(
          child: Icon(Icons.check),
          backgroundColor: Colors.green,
          onPressed: () {
            String title = _titleTextController.text;
            String link = _linkTextController.text;

            Scaffold.of(context).hideCurrentSnackBar();
            if (isInputValid(title, link)) {
              Navigator.pop(context, Bookmark(title, link));
              return;
            }
            showInputError(context, title, link);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              autofocus: true,
              controller: _titleTextController,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (textInput) {
                FocusScope.of(context).requestFocus(_linkFocusNode);
              },
              decoration: InputDecoration(
                icon: Icon(Icons.title),
                labelText: "title",
                hintText: "Title of the bookmark",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextFormField(
              controller: _linkTextController,
              focusNode: _linkFocusNode,
              decoration: InputDecoration(
                icon: Icon(Icons.link),
                labelText: "URL",
                hintText: "WebPage URL",
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool isInputValid(String title, String link) {
    return title.isNotEmpty && link.isNotEmpty;
  }

  void showInputError(BuildContext context, String title, String link) {
    if (title.isEmpty) {
      showSnackBar(context, "title empty.");
    }

    if (link.isEmpty) {
      showSnackBar(context, "link empty.");
    }
  }

  void showSnackBar(BuildContext context, String message) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: Duration(seconds: 1),
    ));
  }
}
