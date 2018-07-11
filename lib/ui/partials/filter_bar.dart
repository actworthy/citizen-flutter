import 'package:actworthy_citizen/app_state.dart';
import 'package:actworthy_citizen/constants/material_design_icons.dart';
import 'package:actworthy_citizen/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:actworthy_citizen/redux-actions/filter_actions.dart';

/// A bar of filters that sits underneath the app bar and sticks the to the top of
/// the page.
///
/// If one of the filter buttons is tapped, a filter list will be exapnded and will
/// fill the remaining viewport space. This bar decides whether or not to display
/// the [_FilterItemList] based on the [FilterButtonSelected] in the [AppState].
/// If [FilterButtonSelected.none] is selected, then no [_FilterItemList] is displayed.
///
/// See also: [_FilterDropDownButton] and [_FilterItemList]
class FilterBar extends StatelessWidget {
  final BorderSide greyBorder = BorderSide(color: Colors.grey[400], width: 1.5);

  Widget build(BuildContext context) {
    return StoreConnector<AppState, FilterButtonSelected>(
      converter: (store) => store.state.filterButtonSelected,
      builder: (context, filterButtonSelected) {
        bool showFilters = filterButtonSelected != FilterButtonSelected.none;

        return Column(
          children: <Widget>[
            _buildFilterBar(),
            (showFilters) ? _FilterItemList() : null,
          ].where((elem) => elem != null).toList(),
        );
      },
    );
  }

  /// For now, the [_FilterDropDownButton]s are being expanded to fill the full
  /// [FilterBar]. When search is implemented, they should no longer be expanded;
  /// ie. upon implementing search, remove the [Expanded] widgets surrounding the
  /// [_FilterDropDownButton]s.
  Widget _buildFilterBar() {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Row(
        children: <Widget>[
          // TODO: remove surrounding Expanded widgets when adding search
          Expanded(
            child: _FilterDropDownButton(
              title: "Issues",
              filterButtonName: FilterButtonSelected.issues,
            ),
          ),
          // TODO: remove surrounding Expanded widgets when adding search
          Expanded(
            child: _FilterDropDownButton(
              title: "Types of Actions",
              filterButtonName: FilterButtonSelected.actionTypes,
            ),
          ),
          // TODO: uncomment when ready to implement search
          // Expanded(child: BorderedButton(label: "Search", icon: Icon(ActWorthyIcons.search), onPressed: () {},
          // left: false, right: false,)),
        ],
      ),
    );
  }
}

/// A dropdown styled button that triggers a list of filters to draw
/// itself under the [FilterBar]. When selected, this button will
/// change its icon and color, and will remove its bottom border to
/// signify that its been selected.
///
/// Dispatches a [ShowFiltersAction] to the Redux store when tapped
///
/// See also [_FilterItemList]
class _FilterDropDownButton extends StatelessWidget {
  final String title;
  final FilterButtonSelected filterButtonName;
  final Color _lightGrey = Colors.grey[600];
  final BorderSide _greyBorder =
      BorderSide(color: Colors.grey[400], width: 1.5);

  _FilterDropDownButton({
    @required this.title,
    @required this.filterButtonName,
  });

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, bool>(
      converter: (store) =>
          store.state.filterButtonSelected == this.filterButtonName,
      builder: (context, bool expanded) {
        return Container(
          height: defaultButtonHeight,
          decoration: BoxDecoration(
            border: Border(
              top: _greyBorder,
              bottom: (expanded) ? BorderSide.none : _greyBorder,
              right: _greyBorder,
            ),
          ),
          child: StoreBuilder(
            builder: (context, Store<AppState> store) {
              IconData dropDownIcon = (expanded)
                  ? ActWorthyIcons.arrow_drop_up
                  : ActWorthyIcons.arrow_drop_down;

              return FlatButton(
                textColor: (expanded) ? Colors.teal[200] : _lightGrey,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(title),
                    Icon(dropDownIcon),
                  ],
                ),
                onPressed: () {
                  FilterButtonSelected filter =
                      (expanded) ? FilterButtonSelected.none : filterButtonName;
                  store.dispatch(ShowFiltersAction(filter));
                },
              );
            },
          ),
        );
      },
    );
  }
}

/// A list of filters that has the filter name on the left and the number of
/// actions matching that fitler on the right in a [CircleAvatar].
///
/// See also [FilterBar] and [_FilterDropDownButton]
class _FilterItemList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.white,
        child: ListView.builder(
          itemCount: 15,
          itemBuilder: (context, index) => _buildFilterItem(context, index),
        ),
      ),
    );
  }

  Widget _buildFilterItem(BuildContext context, int index) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20.0, 13.0, 20.0, 13.0),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey[300])),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              "item #$index",
              style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0),
            ),
          ),
          CircleAvatar(
            radius: 18.0,
            backgroundColor: Colors.yellow,
            child: Text(
              "$index",
              style: TextStyle(color: Colors.black, fontSize: 16.0),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
