import 'package:flutter/material.dart';
import 'package:actworthy_citizen/ui/partials/app_bar_partial.dart';
import 'package:actworthy_citizen/ui/partials/bottom_nav_bar_partial.dart';
import 'package:actworthy_citizen/ui/views/act_view.dart';

/// Creates the general [Scaffold] with an [AppBar] from the [buildAppBar]
/// function and a [BottomNavBarPartial] that remain consistent across _most_
/// screens. The body of the param of the scaffold defaults to [ActView], as
/// that will be considered the home screen of the app.
///
/// When the user navigates via the [BottomNavBarPartial], the [ActView] is
/// swapped out with the [InspireView] and [SetttingsView] depending on where
/// the user navigates to.
///
/// Instantiated by [App]
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: ActView(),
      bottomNavigationBar: BottomNavBarPartial(),
    );
  }
}
