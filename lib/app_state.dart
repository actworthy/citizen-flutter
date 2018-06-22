import 'package:actworthy_citizen/models/action.dart';

class AppState {
  List<Action> actions;
  bool isLoading;
  Exception error;

  AppState({
    this.actions = const [],
    this.isLoading = false,
    this.error,
  });
}
