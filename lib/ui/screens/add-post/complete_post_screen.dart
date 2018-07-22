import 'dart:io';

import 'package:flutter/material.dart';

import '../../../constants/actworthy_colors.dart';

/// The last screen used when adding a [Post]. Here, the user may optionally add
/// a description to the picture that they've just uploaded via [AddPostScreen].
///
/// See also: [Action].
class CompletePostScreen extends StatelessWidget {
  final File image;

  CompletePostScreen(this.image) : assert(image != null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        // Setting reverse to true forces the scrollview to scroll up when the keyboard opens
        reverse: true,
        child: Column(children: <Widget>[
          Text(
            "Say something about this photo...",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
          ),
          Padding(padding: const EdgeInsets.only(top: 12.0)),
          Image.file(image),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                color: ActWorthyColors.offWhite,
                border: Border(
                  top: BorderSide(color: ActWorthyColors.lightGrey, width: 2.0),
                ),
              ),
              child: TextField(
                maxLines: 3,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: "Say something about this photo...",
                  contentPadding: const EdgeInsets.all(12.0),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.white12,
      actions: <Widget>[
        FlatButton(
          child: Text(
            "Post",
            style: TextStyle(color: ActWorthyColors.primary, fontSize: 16.0),
          ),
          onPressed: () {},
        )
      ],
    );
  }
}
