import 'package:flutter/material.dart';

import '../../../constants/actworthy_colors.dart';
import '../../../constants/material_design_icons.dart';
import '../../partials/bordered_button.dart';

/// A card representing a [Post]. Displayed inside of an [ActionCard].
/// Tapping on the image inside of the [PostCard] will open the [PostDetail]
/// modal.
///
/// See also [ActionCard].
class PostCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400.0,
      decoration: BoxDecoration(
        border: Border.all(color: ActWorthyColors.grey),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: ActWorthyColors.lightGrey,
            spreadRadius: 1.0,
            blurRadius: 2.0,
          )
        ],
      ),
      // TODO: make data dynamic
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.all(12.0),
            color: Colors.teal[400],
            height: 300.0,
            width: 400.0,
            child: Center(child: Text("Am a picture")),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              "Here is some text about the picture presumably. Some times, this will be here. Sometimes it won't.",
              style: TextStyle(color: ActWorthyColors.darkGrey),
            ),
          ),
          Padding(padding: const EdgeInsets.all(8.0)),
          Container(
            color: Colors.white,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: BorderedButton(
                    label: "Share",
                    bottom: false,
                    left: false,
                    icon: Icon(ActWorthyIcons.share),
                    onPressed: () {},
                  ),
                ),
                Expanded(
                  child: BorderedButton(
                    label: "Like",
                    icon: Icon(ActWorthyIcons.wb_sunny),
                    bottom: false,
                    left: false,
                    right: false,
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
