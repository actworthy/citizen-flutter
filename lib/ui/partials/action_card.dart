import 'package:actworthy_citizen/app_state.dart';
import 'package:actworthy_citizen/constants/actworthy_colors.dart';
import 'package:actworthy_citizen/constants/material_design_icons.dart';
import 'package:actworthy_citizen/models/action.dart';
import 'package:actworthy_citizen/ui/partials/icon_with_label.dart';
import 'package:actworthy_citizen/ui/partials/post_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:actworthy_citizen/constants/sizes.dart';

/// Builds an action card that will house any [Post]s associated with the [Action]
/// in a horizontal scroll view. Tapping on the see more button will take the user
/// to the Action Detail screen.
///
/// See also [PostCard] which displays each [Post]
class ActionCard extends StatefulWidget {
  /// The index of the [Action] within the [AppState.actions] list. Used to find
  /// the [Action] this card needs to present.
  final int index;

  ActionCard(this.index);

  @override
  State<StatefulWidget> createState() => ActionCardState();
}

class ActionCardState extends State<ActionCard> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Action>(
      converter: (store) => store.state.actions[widget.index],
      builder: (context, action) => _buildActionCard(context, action),
    );
  }

  /// Displays an action's data and builds a call to action using [_buildCallToAction]
  Widget _buildActionCard(BuildContext context, Action action) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 6.0),
        color: ActWorthyColors.offWhite,
        child: Column(
          children: <Widget>[
            _buildHeaderListTile(action),
            _buildPostsScrollView(),
            _buildPostScrollIndicators(),
            _buildCallToAction(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderListTile(Action action) {
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
      subtitle: Text(action.organization.name),
      trailing: IconButton(
        padding: const EdgeInsets.all(0.0),
        icon: Icon(
          ActWorthyIcons.chevron_right,
          color: ActWorthyColors.lightGrey,
          size: 35.0,
        ),
        onPressed: () {},
      ),
    );
  }

  Widget _buildPostsScrollView() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      height: 423.0,
      child: CustomScrollView(
        physics: PageScrollPhysics(parent: BouncingScrollPhysics()),
        scrollDirection: Axis.horizontal,
        slivers: <Widget>[
          SliverFixedExtentList(
            itemExtent: postCardWidth,
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: PostCard(),
                );
              },
              childCount: 3,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPostScrollIndicators() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 6.0),
            child: Row(
              children: <Widget>[
                Text(
                  // TODO: make dynamic
                  "3 posts",
                  style: TextStyle(color: ActWorthyColors.darkGrey),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // TODO: add dot indicators
            ],
          ),
        ],
      ),
    );
  }

  /// Draws a call to action where the [FlattButton] labeled "Take Action" is aligned
  /// to the end of the action [Card], and the [IconButton]s (save, share, and create
  /// post) are aligned at the start of the card
  ///
  /// When the action's type is something like 'email' or 'call', the Take Action
  /// button with open the proper app.
  ///
  /// See also [_buildActionCard], [ActView]
  Widget _buildCallToAction() {
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
                onPressed: () => {},
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
