import 'package:actworthy_citizen/ui/partials/app_bar_partial.dart';
import 'package:actworthy_citizen/ui/partials/navigation_bar_partial.dart';
import 'package:flutter/material.dart';

class InspireScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: _buildInspireFeed(),
      bottomNavigationBar: bottomNavBar,
    );
  }

  Widget _buildInspireFeed() {
    return Container(
      child: Center(
        child: Text("Inspirational"),
      ),
    );
  }
}
