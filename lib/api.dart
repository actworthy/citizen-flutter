import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:flutter/material.dart';

const BASE_URL = "https://api.actworthy.org/v1";

Future<HttpClientResponse> fetchActions() async {
  return await http
      .get(
        "$BASE_URL/actions",
        headers: {"Accept": "application/json"},
      )
      .then((response) => response.body)
      .then(json.decode)
      .then((map) => map["body"])
      .then((actions) => actions.forEach())
      .catchError((err) => debugPrint(err));
}
