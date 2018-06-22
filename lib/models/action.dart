import 'package:actworthy_citizen/models/organization.dart';
import 'package:flutter/foundation.dart';

// TODO: document when functional
class Action {
  final String title;
  final String summary;
  final String type;
  final Organization organization;
  final List<String> issues;
  final DateTime expiresOn;

  Action({
    @required this.title,
    @required this.summary,
    @required this.type,
    @required this.organization,
    @required this.issues,
    @required this.expiresOn,
  });

  factory Action.fromJson(json) {
    return Action(
      title: json["headline"],
      summary: json["summary"],
      type: json["action_type"],
      organization: Organization.fromJson(json["organization"]),
      issues: List.from(json["issues"]),
      expiresOn: DateTime.parse(json["expires"]),
    );
  }
}
