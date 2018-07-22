import 'package:flutter/material.dart';

import 'ui/screens/login_screen.dart';
import 'ui/screens/sign_up_screen.dart';
import 'ui/screens/settings_screen.dart';
import 'ui/screens/act-screen/act_screen.dart';

/// Creates a [MaterialApp] with a title, theme, home which is set to [HomeScreen],
/// and named routes for the [Navigator] to use.
///
/// Instantiated by [ActWorthyApp]
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ActWorthy',
      theme: ThemeData(
        primaryColor: Colors.white,
        buttonTheme: ButtonThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100.0),
          ),
        ),
      ),
      home: ActScreen(),
      routes: <String, WidgetBuilder>{
        '/act': (BuildContext context) => ActScreen(),
        '/settings': (BuildContext context) => SettingsScreen(),
        '/login': (BuildContext context) => LoginScreen(),
        '/signup': (BuildContext context) => SignUpScreen(),
      },
    );
  }
}
