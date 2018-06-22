import 'package:flutter/material.dart';
import 'package:actworthy_citizen/ui/partials/app_bar_partial.dart';
import 'package:actworthy_citizen/ui/views/act_view.dart';

/// Creates the app's general [Scaffold] with an [AppBar] from the [buildAppBar]
/// function and a [BottomNavigationBar] from the [BottomNavBarPartial] class.
/// We create the AppBar and BottomNavBar here so that they will be the same in
/// _most_ views. The `body` param of the scaffold defaults to [ActView], as it is
/// considered to be the home view of the app.
///
/// When the user navigates via the [BottomNavBarPartial], [ActView] is
/// swapped out with [InspireView] and [SetttingsView] depending on where
/// the user navigates to.
///
/// Instantiated by [App]
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: ActView(),
    );
  }
}
