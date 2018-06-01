import 'package:actworthy_citizen/models/action.dart';
import 'package:actworthy_citizen/redux-actions/add_action_items_redux_action.dart';

List<Action> appReducers(List<Action> items, dynamic action) {
  if (action is AddActionItemsReduxAction) {
    return addItem(items, action);
  }
  return items;
}

List<Action> addItem(
    List<Action> items, AddActionItemsReduxAction reduxAction) {
  return List.from(items)..addAll(reduxAction.items);
}
