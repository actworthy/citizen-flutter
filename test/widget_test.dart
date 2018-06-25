import 'package:actworthy_citizen/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:redux/redux.dart';
import 'package:actworthy_citizen/main.dart';
import 'package:actworthy_citizen/constants/material_design_icons.dart';

void main() {
  testWidgets('App bar shows on home screen', (WidgetTester tester) async {
    final store = Store<AppState>(null, initialState: AppState());

    // Build our app and trigger a frame.
    await tester.pumpWidget(ActWorthyApp(store));

    // Verify that the app bar is displayed.
    expect(find.widgetWithIcon(AppBar, ActWorthyIcons.person), findsOneWidget);
  });
}
