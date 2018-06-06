import 'package:flutter/material.dart';

/// Act screen. Creates a list of [Card] representing actions a user will be able
/// to filter in the future. Accesses the Redux store to list the actions.
class ActView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: new Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 0.0),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: _buildActionCard,
        ),
      ),
    );
  }

  // NOTE: When api is implemented, this is an example of how to use the store
  // connector widget. First generic is what the state's type, second is the type
  // is output to the builder

  // Widget buildCard(BuildContext context, int index) {
  //   return StoreConnector<List<Action>, Action>(
  //     converter: (store) => store.state[index],
  //     builder: (context, action) => Text(action.name),
  //   );
  // }

  /// Displays an action's data and builds a call to action using [_buildCallToAction]
  Widget _buildActionCard(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Card(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 6.0, 8.0, 0.0),
              child: new Row(
                children: <Widget>[
                  Text(
                    "#A issue, #Issues galore",
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
                  Icons.card_giftcard,
                  color: Colors.grey[800],
                ),
                backgroundColor: Colors.yellow[400],
              ),
              title: const Text("Large, Bold, Clear Title"),
              subtitle: Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text("Organization of Titles"),
                    ],
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Icon(
                          Icons.group_add,
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
                subtitle: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent dictum aliquet" +
                        "ultricies. Vestibulum commodo suscipit lacinia. Donec suscipit vehicula" +
                        " fermentum..."),
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
          icon: Icon(Icons.bookmark_border),
          color: Colors.grey,
          tooltip: "Save action",
          onPressed: () => {},
        ),
        IconButton(
          icon: Icon(Icons.share),
          color: Colors.grey,
          tooltip: "Share action",
          onPressed: () => {},
        ),
        IconButton(
          icon: Icon(Icons.edit),
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
