import 'package:actworthy_citizen/models/action.dart';
import 'package:actworthy_citizen/redux-actions/filter_actions.dart';

class AppState {
  List<Action> actions;
  bool isLoading;
  Exception error;
  FilterButtonSelected filterButtonSelected;

  AppState({
    this.actions = const [],
    this.isLoading = false,
    this.error,
    this.filterButtonSelected = FilterButtonSelected.none,
  });
}
