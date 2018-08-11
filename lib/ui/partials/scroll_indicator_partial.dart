import 'package:flutter/material.dart';

import '../../constants/actworthy_colors.dart';

class ScrollPositionIndicator extends StatelessWidget {
  final int pageCount;
  final int activePageIndex;

  /// Creates scroll position indicators based on the currently displayed
  /// page. If there are more than 5 pages, indicates which page is shown
  /// (active) with plain text, like this: "4/7", for example.
  ///
  /// If there are 5 pages or less, it creates dots representing each page.
  /// Colors the dot matching the active page black, and the other dots a
  /// light grey.
  ///
  /// State for [activePageIndex] should be handled in the parent widget.
  ///
  /// Implemented by:
  ///   - [ActionCard]
  ///   - [PostDetailScreen]
  ScrollPositionIndicator(this.pageCount, this.activePageIndex)
      : assert(pageCount >= 0),
        assert(activePageIndex >= 0);

  @override
  Widget build(BuildContext context) {
    return (pageCount < 6)
        ? _buildDots(pageCount)
        : Text(
            "${activePageIndex + 1}/$pageCount",
            style: TextStyle(color: ActWorthyColors.darkGrey),
          );
  }

  /// Recursively build the scroll indicator dots.
  Widget _buildDots(int pageCount,
      {int index = 0, List<Widget> dots = const []}) {
    assert(pageCount >= 0);

    if (index == pageCount) return Row(children: dots);

    return _buildDots(
      pageCount,
      index: index + 1,
      dots: List.from(dots)
        ..add(
          Container(
            height: 7.0,
            width: 7.0,
            margin: const EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: (index == activePageIndex)
                  ? ActWorthyColors.blackish
                  : ActWorthyColors.lightGrey,
            ),
          ),
        ),
    );
  }
}
