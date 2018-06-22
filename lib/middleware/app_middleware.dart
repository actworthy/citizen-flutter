import 'package:redux/redux.dart';
import 'package:actworthy_citizen/redux-actions/action_redux_actions.dart';
import 'package:actworthy_citizen/app_state.dart';
import 'package:actworthy_citizen/api.dart' as api;
import 'package:actworthy_citizen/models/action.dart';

void fetchActionsMiddleware(
    Store<AppState> store, reduxAction, NextDispatcher next) {
  if (reduxAction is FetchActionsReduxAction) {
    api.fetchActions().then((List<Action> actions) {
      store.dispatch(FetchActionsSucceededReduxAction(actions));
    }).catchError((err) {
      store.dispatch(FetchActionsFailedReduxAction(err));
    });
  }

  // Make sure our actions continue on to the reducer.
  next(reduxAction);
}
