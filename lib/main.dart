import 'package:flutter/material.dart';
import 'package:actworthy_citizen/app.dart';
import 'package:actworthy_citizen/reducers/app_reducer.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:actworthy_citizen/app_state.dart';
import 'package:redux/redux.dart';
import 'package:actworthy_citizen/middleware/app_middleware.dart';
import 'package:actworthy_citizen/redux-actions/action_redux_actions.dart';

void main() {
  final store = Store<AppState>(
    appReducers,
    initialState: AppState(),
    middleware: [fetchActionsMiddleware],
  );
  runApp(ActWorthyApp(store));
}

/// Wraps the [App] class with a [StoreProvidor] so that any child widget in the
/// tree can access the redux store
class ActWorthyApp extends StatelessWidget {
  final Store<AppState> store;

  ActWorthyApp(this.store) {
    store.dispatch(FetchActionsReduxAction());
  }

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: App(),
    );
  }
}
