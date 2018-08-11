import 'package:actworthy_citizen/models/organization.dart';
import 'package:actworthy_citizen/models/issue.dart';
import 'package:actworthy_citizen/models/post.dart';
import 'package:flutter/foundation.dart';

/// An [Action] is anything a user can do to affect their community.
/// They are "actions" users can take. For example: an [Action] might be
/// to volunteer at the local homeless shelter, or call a senator.
///
/// See also: [ActionType], [Organization], [Issue]
class Action {
  final String title;

  /// A short description on how to take the action and why
  final String summary;
  final String type;
  final Organization organization;

  // The list of posts associated with this Action
  final List<Post> posts;

  /// All of the [Issue]s associated with this Action
  final List<Issue> issues;

  /// After this date, the Action should no longer be displayed
  final DateTime expiresOn;

  /// A unique, human-readable identifier used for the action's url
  final String slug;

  Action({
    @required this.title,
    @required this.summary,
    @required this.type,
    @required this.organization,
    @required this.issues,
    @required this.expiresOn,
    @required this.posts,
    @required this.slug,
  });

  factory Action.fromJson(json) {
    return Action(
      title: json["headline"],
      summary: json["summary"],
      type: json["action_type"],
      organization: Organization.fromJson(json["organization"]),
      issues: List.from(json["issues"].map((issue) => Issue(issue))),
      expiresOn: DateTime.parse(json["expires"]),
      posts: [],
      slug: json["slug"],
    );
  }
}
