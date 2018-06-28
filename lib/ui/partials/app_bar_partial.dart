import 'package:flutter/material.dart';
import 'package:actworthy_citizen/constants/material_design_icons.dart';

/// Returns an [AppBar] to be used in the app's [HomeScreen], gives it a
/// title of 'ActWorthy', and sets up the login [IconButton].
AppBar buildAppBar(BuildContext context, {String title}) {
  return AppBar(
    elevation: 0.0,
    title: (title != null && title.isNotEmpty)
        ? Text(title)
        : Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset('assets/actworthy-logo.png', fit: BoxFit.cover),
          ),
    actions: <Widget>[
      IconButton(
        icon: Icon(
          ActWorthyIcons.person,
          color: Colors.grey,
        ),
        onPressed: () => Navigator.of(context).pushNamed('/login'),
      ),
    ],
  );
}
