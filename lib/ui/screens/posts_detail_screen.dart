import 'package:flutter/material.dart';

import '../../constants/actworthy_colors.dart';
import '../../constants/material_design_icons.dart';
import '../partials/scroll_indicator_partial.dart';

/// A screen detailing the list of [Post]s from a single [Action].
class PostsDetailScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PostsDetailScreenState();
}

class PostsDetailScreenState extends State<PostsDetailScreen> {
  int activePostIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavBar(context),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      automaticallyImplyLeading: false,
      actions: <Widget>[
        IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(ActWorthyIcons.close, size: 34.0),
        )
      ],
    );
  }

  Widget _buildBody() {
    return PageView.builder(
      itemBuilder: (context, index) => _buildPage(),
      itemCount: 3,
      onPageChanged: (index) {
        setState(() => activePostIndex = index);
      },
    );
  }

  Widget _buildPage() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Placeholder(),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              "Here is some text about the picture presumably. Some times, this will be here. Sometimes it won't.",
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavBar(BuildContext context) {
    final TextStyle greyText = TextStyle(color: ActWorthyColors.darkGrey);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15.0),
      padding: const EdgeInsets.only(top: 5.0, bottom: 8.0),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: ActWorthyColors.grey, width: 1.5),
        ),
      ),
      child: Row(
        children: <Widget>[
          Expanded(child: ScrollPositionIndicator(3, activePostIndex)),
          FlatButton.icon(
            label: Text("Share", style: greyText),
            onPressed: () {},
            icon: Icon(
              ActWorthyIcons.share,
              color: ActWorthyColors.darkGrey,
            ),
          ),
          FlatButton.icon(
            label: Text("Like", style: greyText),
            onPressed: () {},
            icon: Icon(
              ActWorthyIcons.wb_sunny,
              color: ActWorthyColors.darkGrey,
            ),
          ),
        ],
      ),
    );
  }
}
