import 'package:flutter/material.dart';

import '../../models/action.dart';
import '../../constants/material_design_icons.dart';
import '../../constants/actworthy_colors.dart';
import '../partials/action_header.dart';
import 'add-post/add_post_screen.dart';

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
      backgroundColor: ActWorthyColors.offWhite,
      title: Align(
        alignment: Alignment.centerRight,
        child: Text(
          action.issues.map((issue) => "#${issue.name}").join(", "),
          style: TextStyle(color: ActWorthyColors.grey, fontSize: 14.0),
        ),
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
      color: ActWorthyColors.offWhite,
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
          border: Border(
              top: BorderSide(color: ActWorthyColors.lightGrey, width: 1.5))),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FlatButton.icon(
                icon: Icon(ActWorthyIcons.camera_alt),
                label: Text("Add Post"),
                color: ActWorthyColors.lightGrey,
                textColor: ActWorthyColors.darkGrey,
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
                onPressed: () => {},
              ),
            ),
          )
        ],
      ),
    );
  }
}
