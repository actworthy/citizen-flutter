import 'package:flutter/material.dart';
import 'package:actworthy_citizen/app_state.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:actworthy_citizen/ui/partials/action_card.dart';
import 'package:actworthy_citizen/constants/actworthy_colors.dart';
import 'package:actworthy_citizen/ui/partials/filter_bar.dart';

/// Act screen. Creates a list of [ActionCard] representing actions a user will be able
/// to filter in the future. Accesses the Redux store to list the actions.
class ActView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 8.0),
          color: ActWorthyColors.lightGrey,
          child: StoreConnector<AppState, int>(
            converter: (store) => store.state.actions.length,
            builder: (context, length) => (length > 0)
                ? ListView.builder(
                    itemCount: length,
                    itemBuilder: (context, index) => ActionCard(index),
                  )
                : Center(child: CircularProgressIndicator()),
          ),
        ),
        FilterBar(),
      ],
    );
  }
}
