import 'package:flutter/material.dart';
import 'package:actworthy_citizen/ui/partials/labeled_checkbox_partial.dart';
import 'package:actworthy_citizen/ui/partials/form_text_field_partial.dart';
import 'package:actworthy_citizen/ui/partials/app_bar_partial.dart';

// notification settings:
//  - email
//  - app (push notifs)
//  - (later: SMS)
// Location
// Change password (should add "forgot password" to login as well)

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: 'Settings'),
      body: SettingsView(),
    );
  }
}

class SettingsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ListView(
          children: <Widget>[
            Text(
              "Notifications",
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            Divider(color: Colors.grey[700]),
            LabeledCheckbox(label: "Email", value: false),
            LabeledCheckbox(label: "Push Notifications", value: false),
            LabeledCheckbox(label: "SMS", value: false),
            Text(
              "Security",
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            Divider(color: Colors.grey[700]),
            ChangePasswordForm(),
          ],
        ),
      ),
    );
  }
}

/// Form requiring the user's current password for verification, also verifies
/// the new password with a confirmation field.
///
/// IME Submit button jumps to the next field if there is one.
///
/// See also [buildTextFormField] which builds the [TextFormField]s
class ChangePasswordForm extends StatefulWidget {
  @override
  State<ChangePasswordForm> createState() {
    return ChangePasswordFormState();
  }
}

class ChangePasswordFormState extends State<ChangePasswordForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormFieldState<String>> _passwordFieldKey =
      GlobalKey<FormFieldState<String>>();
  final FocusNode _newPWNode = FocusNode();
  final FocusNode _confirmNewPWNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidate: true,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: buildTextFormField(
              labelText: "Old Password",
              obscureText: true,
              autocorrect: false,
              context: context,
              focusOnSubmit: _newPWNode,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: buildTextFormField(
              key: _passwordFieldKey,
              labelText: "New Password",
              obscureText: true,
              autocorrect: false,
              focusNode: _newPWNode,
              context: context,
              focusOnSubmit: _confirmNewPWNode,
            ),
          ),
          // TODO: scroll this field into view on focus. Rn it fouses, but is hidden by keyboard...
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: buildTextFormField(
              labelText: "Confirm New Password",
              obscureText: true,
              autocorrect: false,
              focusNode: _confirmNewPWNode,
              validator: (value) {
                String newPW = _passwordFieldKey.currentState.value;

                return (value != newPW) ? "Passwords must match" : null;
              },
            ),
          ),
          Padding(padding: const EdgeInsets.symmetric(vertical: 4.0)),
          RaisedButton(
            child: Text("Save"),
            color: Colors.teal[400],
            onPressed: () {},
          )
        ],
      ),
    );
  }

  // Focos nodes must be disposed of
  @override
  void dispose() {
    _newPWNode.dispose();
    _confirmNewPWNode.dispose();
    super.dispose();
  }
}
