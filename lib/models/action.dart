import 'package:actworthy_citizen/models/issue.dart';
import 'package:actworthy_citizen/models/action_type.dart';

// TODO: document when functional
class Action {
  final String title;
  final String summary;
  final ActionType type;
  final String orgName;
  final List<Issue> issues;
  final DateTime expiresOn;

  Action({
    this.title,
    this.summary,
    this.type,
    this.orgName,
    this.issues,
    this.expiresOn,
  });

  factory Action.fromJson(json) {
    return Action(
      title: json["headline"],
      summary: json["summary"],
      type: json["action_type"],
      orgName: json["organization"]["name"],
      issues: json["issues"],
      expiresOn: json["expires"],
    );
  }
}
