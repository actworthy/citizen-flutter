import 'dart:async';
import 'dart:convert';
import 'package:actworthy_citizen/constants/urls.dart';
import 'package:http/http.dart' as http;
import 'package:actworthy_citizen/models/action.dart';

// Used only as the first action loading call
Future<List<Action>> fetchActions() async {
  return await http
      .get(
        "$apiUrl/actions",
        headers: {"Accept": "application/json"},
      )
      .then((response) => response.body)
      .then(json.decode)
      .then((actions) => _parseActions(actions));
}

Future<List<Action>> _parseActions(Map unparsedActions) async {
  final List<Map<String, dynamic>> actions = List.from(unparsedActions["data"]);
  return actions.map((action) => Action.fromJson(action)).toList();
}
