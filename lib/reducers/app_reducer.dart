import 'package:actworthy_citizen/models/action.dart';
import 'package:actworthy_citizen/redux-actions/add_action_items_redux_action.dart';
import 'package:actworthy_citizen/app_state.dart';

/// Aggregates all reducers
AppState appReducers(AppState appState, dynamic action) {
  if (action is AddActionItemsReduxAction) {
    /// Is setting it like this going to upset Redux?
    appState.actions = addActionItems(appState.actions, action);
  }
  return appState;
}

List<Action> addActionItems(
    List<Action> items, AddActionItemsReduxAction reduxAction) {
  return List.from(items)..addAll(reduxAction.items);
}
