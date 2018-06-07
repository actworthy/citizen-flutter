import 'package:flutter/material.dart';
import 'package:actworthy_citizen/app.dart';
import 'package:actworthy_citizen/reducers/app_reducer.dart';
import 'package:actworthy_citizen/models/action.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:redux/redux.dart';

void main() {
  final store =
      Store<List<Action>>(appReducers, initialState: [Action("An Action")]);
  runApp(ActWorthyApp(store));
}

/// Wraps the [App] class with a [StoreProvidor] so that any child widget in the
/// tree can access the redux store
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
