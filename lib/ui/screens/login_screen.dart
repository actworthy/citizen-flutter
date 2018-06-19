import 'package:flutter/material.dart';
import 'package:actworthy_citizen/ui/partials/form_text_field_partial.dart';

/// Displays login form and is instantiated from the [buildAppBar]
class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[700],
        title: Text("Login"),
      ),
      body: LoginForm(),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

// TODO: Document
/// Placeholder inputs
class LoginFormState extends State<LoginForm> {
  // Create a global key that will uniquely identify the Form widget and allow
  // us to validate the form
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  // TODO: extract text inputs?
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        autovalidate: true,
        key: _formKey,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: buildTextFormField(labelText: "Email"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: buildTextFormField(
                labelText: "Password",
                obscureText: true,
                autocorrect: false,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      color: Colors.blue,
                      onPressed: () =>
                          Navigator.of(context).pushNamed("/signup"),
                      child: Text("Sign up"),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      color: Colors.green[800],
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          Scaffold.of(context).showSnackBar(new SnackBar(
                              content: new Text('Processing Data')));
                        }
                      },
                      child: Text("Login"),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
