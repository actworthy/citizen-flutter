import 'package:flutter/material.dart';
import 'package:actworthy_citizen/ui/partials/aw_navigation_bar.dart';
import '../partials/aw_app_bar.dart';

class ActScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: ActionCardList(),
      bottomNavigationBar: AWNavigationBar(),
    );
  }
}

class ActionCardList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: new Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 0.0),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: buildActionCard,
        ),
      ),
    );
  }

  Widget buildActionCard(BuildContext context, int index1) {
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

  Widget _buildCallToAction() {
    return ButtonTheme.bar(
      child: ButtonBar(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.bookmark_border),
            color: Colors.grey,
            tooltip: "Save action",
            onPressed: () => debugPrint("Saved action"),
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
          FlatButton(
            child: const Text("Take Action"),
            textColor: Colors.deepPurple,
            onPressed: () => debugPrint("Took action"),
          ),
        ],
      ),
    );
  }
}
