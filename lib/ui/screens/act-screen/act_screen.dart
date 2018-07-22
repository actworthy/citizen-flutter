import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../../app_state.dart';
import 'action_card.dart';
import '../../../constants/actworthy_colors.dart';
import '../../partials/filter_bar.dart';
import '../../partials/app_bar_partial.dart';

/// App's home screen. Creates a list of [ActionCard] representing actions a user will be able
/// to filter in the future. Accesses the Redux store to list the actions.
class ActScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Stack(
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
      ),
    );
  }
}
