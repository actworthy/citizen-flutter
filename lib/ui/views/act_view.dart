import 'package:flutter/material.dart';
import 'package:actworthy_citizen/app_state.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:actworthy_citizen/ui/partials/action_card.dart';
import 'package:actworthy_citizen/constants/actworthy_colors.dart';
import 'package:actworthy_citizen/ui/partials/filter_bar.dart';

/// Act screen. Creates a list of [ActionCard] representing actions a user will be able
/// to filter in the future. Accesses the Redux store to list the actions.
class ActView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 8.0),
          color: Colors.grey,
          child: StoreConnector<AppState, int>(
            converter: (store) => store.state.actions.length,
            builder: (context, length) => (length > 0)
                ? ListView.builder(
                    itemCount: length,
                    itemBuilder: _buildCard,
                  )
                : Center(child: CircularProgressIndicator()),
          ),
        ),
        FilterBar(),
      ],
    );
  }

  Widget _buildCard(BuildContext context, int index) {
    return StoreConnector<AppState, Action>(
      converter: (store) => store.state.actions[index],
      builder: (context, action) => _buildActionCard(context, action),
    );
  }

  /// Displays an action's data and builds a call to action using [_buildCallToAction]
  Widget _buildActionCard(BuildContext context, Action action) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Card(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 6.0, 8.0, 0.0),
              child: new Row(
                children: <Widget>[
                  // Issues
                  Text(
                    action.issues.map((issue) => "#${issue.name}").join(", "),
                    style: TextStyle(
                      color: Colors.blue[200],
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                child: Icon(
                  ActWorthyIcons.card_giftcard,
                  color: Colors.grey[800],
                ),
                backgroundColor: Colors.yellow[400],
              ),
              title: Text(action.title),
              subtitle: Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(action.organization.name),
                    ],
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Icon(
                          ActWorthyIcons.group_add,
                          color: Colors.grey[600],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ListTile(
                subtitle: Text(action.summary),
              ),
            ),
            _buildCallToAction(),
          ],
        ),
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
    return Row(
      children: <Widget>[
        IconButton(
          icon: Icon(ActWorthyIcons.bookmark_border),
          color: Colors.grey,
          tooltip: "Save action",
          onPressed: () => {},
        ),
        IconButton(
          icon: Icon(ActWorthyIcons.share),
          color: Colors.grey,
          tooltip: "Share action",
          onPressed: () => {},
        ),
        IconButton(
          icon: Icon(ActWorthyIcons.edit),
          color: Colors.grey,
          tooltip: "Create an inpsiring post about action",
          onPressed: () => {},
        ),
        Expanded(
          child: Container(
            alignment: AlignmentDirectional.centerEnd,
            child: FlatButton(
              child: const Text("Take Action"),
              textColor: Colors.deepPurple,
              onPressed: () => {},
            ),
          ),
        ),
      ],
    );
  }
}
