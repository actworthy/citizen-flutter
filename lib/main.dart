import 'package:flutter/material.dart';
import 'package:actworthy_citizen/ui/screens/login_screen.dart';
import 'package:actworthy_citizen/ui/screens/act_screen.dart';
import 'package:actworthy_citizen/ui/screens/inspire_screen.dart';
import 'package:actworthy_citizen/ui/screens/settings_screen.dart';
import 'package:actworthy_citizen/reducers/app_reducer.dart';
import 'package:actworthy_citizen/models/action.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:redux/redux.dart';

void main() {
  final store =
      Store<List<Action>>(appReducers, initialState: [Action("An Action")]);
  runApp(ActWorthyApp(store));
}

class ActWorthyApp extends StatelessWidget {
  final Store<List<Action>> store;

  ActWorthyApp(this.store);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<List<Action>>(
      store: store,
      child: App(),
    );
  }
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
        '/inspire': (BuildContext context) => InspireScreen(),
        '/settings': (BuildContext context) => SettingsScreen(),
      },
    );
  }
}
