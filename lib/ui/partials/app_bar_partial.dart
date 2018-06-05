import 'package:flutter/material.dart';

/// Returns an [AppBar] to be used in the app's [HomeScreen], gives it a
/// title of 'ActWorthy', and sets up the login [IconButton].
AppBar buildAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.purple[700],
    title: Text('ActWorthy'),
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.person),
        onPressed: () => Navigator.of(context).pushNamed('/login'),
      ),
    ],
  );
}
