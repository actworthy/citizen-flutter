import 'package:actworthy_citizen/constants/actworthy_colors.dart';
import 'package:flutter/material.dart';
import 'package:actworthy_citizen/constants/sizes.dart';
import 'package:actworthy_citizen/ui/partials/icon_with_label.dart';

/// Creates a square button with a grey border. Defualts to adding a border to
/// all sides, but setting the [top], [right], [bottom], or [left] parameters to
/// false will remove the border on that side.
///
/// If an [Icon] is provided, this widget will use [IconWithLabel] to label the
/// button with both the icon and the label.
///
/// See also [FlatButton].
class BorderedButton extends StatelessWidget {
  /// Setting this `bool` to `false` removes the border on the corresponding side
  /// of the button
  final bool top, bottom, left, right;

  /// The text label that tells the user what the button does
  final String label;

  /// Adds an [Icon] the left of the text [BorderedButton.label]
  final Icon icon;

  /// Changes the [BorderedButton.label]'s text color
  final Color textColor;

  final Function onPressed;

  final BorderSide _greyBorder =
      BorderSide(color: Colors.grey[400], width: 1.5);

  BorderedButton({
    @required this.label,
    @required this.onPressed,
    this.icon,
    this.textColor = ActWorthyColors.grey,
    this.top = true,
    this.bottom = true,
    this.left = true,
    this.right = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: defaultButtonHeight,
      decoration: BoxDecoration(
        border: Border(
          top: (top) ? _greyBorder : BorderSide.none,
          bottom: (bottom) ? _greyBorder : BorderSide.none,
          right: (right) ? _greyBorder : BorderSide.none,
          left: (left) ? _greyBorder : BorderSide.none,
        ),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
              buttonTheme: ButtonThemeData(shape: BeveledRectangleBorder()),
            ),
        child: FlatButton(
          textColor: textColor,
          child: (icon != null)
              ? IconWithLabel(icon: icon, label: label, textColor: textColor)
              : Text(label),
          onPressed: () {},
        ),
      ),
    );
  }
}
