import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../partials/action_header.dart';
import '../../../app_state.dart';
import '../../../constants/actworthy_colors.dart';
import '../../../models/action.dart';
import 'call_to_action.dart';
import 'post_card.dart';

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
  /// Tracks the [PostCard] that is currently being displayed inside of the
  /// [ActionCard]'s horizontal scroll view.
  int activePostIndex = 0;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Action>(
      converter: (store) => store.state.actions[widget.index],
      builder: (context, action) => _buildActionCard(context, action),
    );
  }

  /// Displays an action's data and builds a call to action using [_buildCallToAction]
  Widget _buildActionCard(BuildContext context, Action action) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      color: ActWorthyColors.offWhite,
      child: Column(
        children: <Widget>[
          ActionHeader(action, clickable: true),
          _buildPostsScrollView(),
          _buildScrollIndicators(action.posts.length),
          CallToAction(action),
        ],
      ),
    );
  }

  Widget _buildPostsScrollView() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      height: 420.0,
      child: PageView.builder(
        itemCount: 3,
        physics: BouncingScrollPhysics(),
        onPageChanged: (index) {
          setState(() => activePostIndex = index);
        },
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: PostCard(),
          );
        },
      ),
    );
  }

  Widget _buildScrollIndicators(int postCount) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 6.0, 10.0, 0.0),
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: _buildNumberOfPostsText(postCount),
          ),
          _buildActivePostIndicators(postCount),
        ],
      ),
    );
  }

  Widget _buildNumberOfPostsText(int postCount) {
    String countText = '';

    if (postCount == 1) countText = '1 post';
    if (postCount > 1) countText = '$postCount posts';

    return Text(countText, style: TextStyle(color: ActWorthyColors.darkGrey));
  }

  /// Creates the row directly below the horizontal Posts scroll view
  /// If there are 6 or more posts, track which post is shown (active)
  /// like this: "4/7" for example
  /// If there are 5 posts or less, create dots representing each post
  /// and color the dot matching the active post black, and the others
  /// a light grey.
  Row _buildActivePostIndicators(int postCount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: (postCount < 6)
          ? _buildDots(postCount)
          : [
              Text(
                "${activePostIndex + 1}/$postCount",
                style: TextStyle(color: ActWorthyColors.darkGrey),
              )
            ],
    );
  }

  /// Recursively build the scroll indicator dots.
  List<Widget> _buildDots(int postCount,
      {int index = 0, List<Widget> dots = const []}) {
    assert(postCount >= 0);

    if (index == postCount) return dots;

    return _buildDots(
      postCount,
      index: index + 1,
      dots: List.from(dots)
        ..add(
          Container(
            height: 7.0,
            width: 7.0,
            margin: const EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: (index == activePostIndex)
                  ? ActWorthyColors.blackish
                  : ActWorthyColors.lightGrey,
            ),
          ),
        ),
    );
  }
}
