import 'package:actworthy_citizen/constants/actworthy_colors.dart';
import 'package:flutter/material.dart';

/// Creates a [Row] with an [Icon] followed by a [Text] widget in the [Row]'s
/// center. Often used in buttons
///
/// See also [BorderedButton].
class IconWithLabel extends StatelessWidget {
  /// An [Icon] that sits to the left of the label
  final Icon icon;

  /// Changes the [IconWithLabel.label]'s text color
  final Color textColor;

  /// The label that sits to the right of the [IconWithLabel.icon] inside
  /// of a [Text] widget
  final String label;

  /// Padding between the icon and the label. Set this to override
  /// the defualt padding
  final Padding padding;

  IconWithLabel({
    @required this.icon,
    @required this.label,
    this.textColor = ActWorthyColors.darkGrey,
    this.padding = const Padding(
      padding: EdgeInsets.all(4.0),
    ),
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        icon,
        padding,
        Text(
          label,
          style: TextStyle(color: textColor),
        ),
      ],
    );
  }
}
