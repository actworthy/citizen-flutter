import 'package:actworthy_citizen/models/action.dart';

class FetchActionsReduxAction {}

class FetchActionsFailedReduxAction {
  var error;

  FetchActionsFailedReduxAction(this.error);
}

/// Redux action that adds multiple actions to the state
class FetchActionsSucceededReduxAction {
  List<Action> actions;

  FetchActionsSucceededReduxAction(this.actions);
}
