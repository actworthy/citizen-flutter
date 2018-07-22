import 'package:flutter/material.dart';

import '../../constants/actworthy_colors.dart';
import '../../constants/material_design_icons.dart';
import '../../models/action.dart';
import '../screens/action_detail_screen.dart';

/// An [Action]'s header. Displays the action's title, author, and [ActionType]
/// in the form of a circular icon. If [clickable] is set to true, this widget will
/// Navigate to the [ActionDetailScreen] when tapped.
///
/// Made from a [ListTile].
///
/// Used by:
///   [ActionCard]
///   [ActionDetailScreen]
///   [AddPostScreen]
class ActionHeader extends StatelessWidget {
  final Action action;
  final bool clickable;

  ActionHeader(this.action, {this.clickable = false});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.only(left: 10.0),
      leading: CircleAvatar(
        child: Icon(
          ActWorthyIcons.card_giftcard,
          color: Colors.grey[800],
        ),
        backgroundColor: ActWorthyColors.sunshine,
      ),
      title: Text(
        action.title,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(action.organization.name, overflow: TextOverflow.ellipsis),
      trailing: (clickable)
          ? Icon(
              ActWorthyIcons.chevron_right,
              color: ActWorthyColors.lightGrey,
              size: 35.0,
            )
          : null,
      onTap: (clickable)
          ? () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ActionDetailScreen(action)),
              );
            }
          : null,
    );
  }
}
