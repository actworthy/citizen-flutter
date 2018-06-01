import 'package:flutter/material.dart';

// TODO: document this AppNav class
class AWNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (index) => _navigate(index, context),
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.check),
          title: Text('Act'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.wb_sunny),
          title: Text('Inspire'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          title: Text('Settings'),
        ),
      ],
    );
  }

  /// Takes the index of the BottomNavigationBarItem that was tapped and
  /// navigates accordingly
  void _navigate(int index, BuildContext context) {
    // TODO: check index and update highlighted accordingly
    Navigator.of(context).pushNamed('/login');
  }
}
