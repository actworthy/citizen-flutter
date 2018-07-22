import 'package:flutter/material.dart';

import '../../partials/icon_with_label.dart';
import '../../../constants/actworthy_colors.dart';
import '../../../constants/material_design_icons.dart';
import '../../../models/action.dart';
import '../add-post/add_post_screen.dart';

/// Draws a call to action where the [FlattButton] labeled "Take Action" is aligned
/// to the end of the action [Card], and the [IconButton]s (save, share, and create
/// post) are aligned at the start of the card
///
/// When the action's type is something like 'email' or 'call', the Take Action
/// button with open the proper app.
///
/// See also [_buildActionCard], [ActView]
class CallToAction extends StatelessWidget {
  final Action _action;

  CallToAction(this._action);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 8.0, 10.0, 0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FlatButton(
                color: ActWorthyColors.lightGrey,
                child: IconWithLabel(
                  icon: Icon(
                    ActWorthyIcons.camera_alt,
                    color: ActWorthyColors.darkGrey,
                  ),
                  label: "Add Post",
                ),
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AddPostScreen(_action))),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FlatButton(
                color: ActWorthyColors.primary,
                child: Text("Take Action"),
                textColor: Colors.white,
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
