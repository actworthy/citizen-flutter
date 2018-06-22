import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:actworthy_citizen/models/action.dart';

const BASE_URL = "https://api.actworthy.org/v1";

// Used only as the first action loading call
Future<List<Action>> fetchActions() async {
  return await http
      .get(
        "$BASE_URL/actions",
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
