import 'package:flutter/material.dart';

/// Each [Action] has an [ActionType] that describes what a user must do
/// to complete the [Action]. Types may include things such as calling,
/// emailing, volunteering, and so on.
///
/// See also [Action]
class ActionType {
  /// The name of the [ActionType]. For example: "calling", "protesting"
  final String name;

  /// An icon that represents the name of the [ActionType]. For example:
  /// a gift icon for an [ActionType.name] of "donate"
  final IconData iconData;

  ActionType({this.name, this.iconData});
}
