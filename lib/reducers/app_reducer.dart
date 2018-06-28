import 'package:actworthy_citizen/redux-actions/action_redux_actions.dart';
import 'package:actworthy_citizen/redux-actions/filter_actions.dart';
import 'package:actworthy_citizen/app_state.dart';

/// Aggregates all reducers
AppState appReducers(AppState appState, dynamic reduxAction) {
  if (reduxAction is FetchActionsReduxAction)
    return _fetchActionItems(appState, reduxAction);
  else if (reduxAction is FetchActionsSucceededReduxAction)
    return _fetchActionsSucceeded(appState, reduxAction);
  else if (reduxAction is FetchActionsFailedReduxAction)
    return _fetchActionsFailed(appState, reduxAction);
  else if (reduxAction is ShowFiltersAction)
    return _showFilters(appState, reduxAction);
  return appState;
}

AppState _fetchActionItems(
    AppState appState, FetchActionsReduxAction reduxAction) {
  // TODO: can we copy the object easily and just change the proper field?
  return AppState(
    actions: appState.actions,
    isLoading: true,
    error: null,
  );
}

// this should have been the first call
AppState _fetchActionsSucceeded(
    AppState appState, FetchActionsSucceededReduxAction reduxAction) {
  return AppState(
    actions: List.from(appState.actions)..addAll(reduxAction.actions),
    isLoading: false,
    error: null,
  );
}

AppState _fetchActionsFailed(
    AppState appState, FetchActionsFailedReduxAction reduxAction) {
  return AppState(
    actions: appState.actions,
    isLoading: false,
    error: reduxAction.error,
  );
}

AppState _showFilters(AppState appState, ShowFiltersAction reduxAction) {
  return AppState(
    actions: appState.actions,
    isLoading: appState.isLoading,
    error: appState.error,
    filterButtonSelected: reduxAction.filterButtonSelected,
  );
}
