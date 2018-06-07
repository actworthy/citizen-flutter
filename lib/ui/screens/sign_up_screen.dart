import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[700],
        title: Text("Signup"),
      ),
      body: SignUpForm(),
    );
  }
}

class SignUpForm extends StatefulWidget {
  @override
  SignUpFormState createState() {
    return SignUpFormState();
  }
}

// TODO: Document
/// Placeholder inputs
class SignUpFormState extends State<SignUpForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormFieldState<String>> _passwordFieldKey =
      GlobalKey<FormFieldState<String>>();
  final FocusNode pwNode = FocusNode();
  final FocusNode confirmPWNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        autovalidate: true,
        key: _formKey,
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: TextFormField(
                validator: validateEmail,
                decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 0.5, color: Colors.teal),
                  ),
                ),
                onFieldSubmitted: (value) =>
                    FocusScope.of(context).requestFocus(pwNode),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: TextFormField(
                key: _passwordFieldKey,
                focusNode: pwNode,
                autocorrect: false,
                obscureText: true,
                validator: validatePassword,
                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 0.5, color: Colors.teal),
                  ),
                ),
                onFieldSubmitted: (value) =>
                    FocusScope.of(context).requestFocus(confirmPWNode),
              ),
            ),
            Text(
              "Password must be at least 8 characters. Must contain uppercase, lowercase, a number, and a symbol.",
              style: TextStyle(
                color: Colors.grey[850],
                fontSize: 12.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: TextFormField(
                autocorrect: false,
                focusNode: confirmPWNode,
                obscureText: true,
                validator: (confirmValue) {
                  final password = _passwordFieldKey.currentState.value;

                  return (confirmValue != password)
                      ? "Passwords must match"
                      : null;
                },
                decoration: InputDecoration(
                  labelText: "Confirm Password",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 0.5, color: Colors.teal),
                  ),
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 8.0, 8.0, 0.0),
                    child: RaisedButton(
                      color: Colors.blue,
                      onPressed: () =>
                          Navigator.of(context).pushNamed("/login"),
                      child: Text("Login"),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 8.0, 0.0, 0.0),
                    child: RaisedButton(
                      color: Colors.green[800],
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          Scaffold.of(context).showSnackBar(new SnackBar(
                              content: new Text('Processing Data')));
                        }
                      },
                      child: Text("Signup"),
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

// 8 chars (including upper, lower, num, & symbol)
String validatePassword(String value) {
  // is empty?
  if (value.isEmpty) return "Please enter some text";
  // at least 8 chars
  if (value.length < 8) return "be at least 8 characters";
  // uppercase letter?
  if (!value.contains(RegExp(r"[A-Z]")))
    return "Password must contain an uppercase letter";
  // lowercase letter?
  if (!value.contains(RegExp(r"[a-z]")))
    return "Password must contain an lowercase letter";
  // number?
  if (!value.contains(RegExp(r"[0-9]")))
    return "Password must contain a number";
  // symbol?
  if (!value.contains(RegExp(r"[\W]"))) return "Password must contain a symbol";

  // if we made it here, all is well.
  return null;
}

String validateEmail(String value) {
  if (value.isEmpty) return "Please enter some text";

  RegExp regex = RegExp(
      r"(^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$)");
  bool matches = regex.hasMatch(value);

  if (!matches) return "Not a valid email address";

  return null;
}
