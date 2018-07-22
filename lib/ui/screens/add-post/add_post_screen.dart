import 'dart:async';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../constants/actworthy_colors.dart';
import '../../../constants/material_design_icons.dart';
import '../../../models/action.dart';
import '../../partials/action_header.dart';
import 'complete_post_screen.dart';

/// A screen that allows users to add a new [Post] to an [Action]
/// starting with a photo (required) and then a description (optional).
/// This screen must be navigated to from an action view.
///
/// See also: [ActionCard] and [ActionDetailScreen], both of which
/// are used to navigate to this screen via an "Add Post" button.
class AddPostScreen extends StatelessWidget {
  final Action action;

  AddPostScreen(this.action);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white12,
      leading: IconButton(
        iconSize: 30.0,
        icon: Icon(
          ActWorthyIcons.close,
          color: ActWorthyColors.primary,
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }

  Stack _buildBody(BuildContext context) {
    return Stack(children: <Widget>[
      Column(children: <Widget>[
        Text(
          "Add a new post for this action...",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          decoration: BoxDecoration(
            color: ActWorthyColors.offWhite,
            boxShadow: [
              BoxShadow(blurRadius: 1.25, color: ActWorthyColors.grey)
            ],
          ),
          child: ActionHeader(action),
        ),
      ]),
      // Center on screen as though there were no other elements in the body
      Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Step 1. Add Photo:"),
            Padding(padding: const EdgeInsets.only(top: 12.0)),
            _buildAddPhotoButton(context, ImageSource.camera),
            Padding(padding: const EdgeInsets.only(top: 12.0)),
            _buildAddPhotoButton(context, ImageSource.gallery),
          ],
        ),
      ),
    ]);
  }

  FlatButton _buildAddPhotoButton(BuildContext context, ImageSource source) {
    final bool fromCamera = (source == ImageSource.camera);

    return FlatButton.icon(
      onPressed: () => _getImage(source, context),
      color: ActWorthyColors.primary,
      label: Text(
        (fromCamera) ? 'Take New' : 'Choose... ',
        style: TextStyle(color: ActWorthyColors.offWhite),
      ),
      icon: Icon(
        (fromCamera)
            ? ActWorthyIcons.add_a_photo
            : ActWorthyIcons.photo_library,
        color: ActWorthyColors.blackish,
      ),
    );
  }

  Future _getImage(ImageSource source, context) async {
    await ImagePicker.pickImage(source: source).then((file) {
      if (file != null) {
        Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => CompletePostScreen(file),
            ));
      }
    });
  }
}
