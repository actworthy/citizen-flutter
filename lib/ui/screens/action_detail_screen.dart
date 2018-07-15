import 'package:flutter/material.dart';
import 'package:actworthy_citizen/models/action.dart';
import 'package:actworthy_citizen/constants/material_design_icons.dart';

class ActionDetailScreen extends StatelessWidget {
  final Action action;

  ActionDetailScreen(this.action);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Color(0xFFF6F6F6),
      title: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(action.issues.map((issue) => "#${issue.name}").join(", "),
                  style: TextStyle(color: Color(0xFFBCBCBC), fontSize: 14.0))
              ],
          ))
        ],
      ),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(children: <Widget>[
        _buildHeader(),
        _buildMainContent(),
      ]),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.only(bottom: 10.0),
      color: Color(0xFFF6F6F6),
      child: ListTile(
        leading: CircleAvatar(
          child: Icon(
            ActWorthyIcons.card_giftcard,
            color: Colors.grey[800],
          ),
          backgroundColor: Colors.yellow[400],
        ),
        title: Text(
          action.title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle:
            Text(action.organization.name, overflow: TextOverflow.ellipsis),
      ),
    );
  }

  Widget _buildMainContent() {
    return Column(
      children: <Widget>[
        Placeholder(
          fallbackHeight: 300.0,
        ),
        Padding(padding: EdgeInsets.all(18.0), child: Text(action.summary)),
      ],
    );
  }

  Widget _buildBottomBar() {
    return Container(
      margin: EdgeInsets.only(left: 15.0, right: 15.0),
      decoration: BoxDecoration(
          border:
              Border(top: BorderSide(color: Color(0xFFCBCBCB), width: 1.5))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FlatButton.icon(
              icon: Icon(ActWorthyIcons.camera_alt),
              label: Text("Add Post"),
              color: Color(0xFFE4E4E4),
              textColor: Colors.grey,
              onPressed: () => {},
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: FlatButton(
                color: Color(0xFF28B496),
                child: Text("Take Action"),
                textColor: Colors.white,
                onPressed: () => {},
              ))
        ],
      ),
    );
  }
}
