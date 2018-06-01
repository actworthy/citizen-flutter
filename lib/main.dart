import 'package:flutter/material.dart';
import 'package:actworthy_citizen/ui/screens/login_screen.dart';
import 'package:actworthy_citizen/ui/screens/act_screen.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ActWorthy',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: ActScreen(),
      routes: <String, WidgetBuilder>{
        '/act': (BuildContext context) => ActScreen(),
        '/login': (BuildContext context) => LoginScreen(),
      },
    );
  }
}
