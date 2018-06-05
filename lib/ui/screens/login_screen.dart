import 'package:flutter/material.dart';

/// Displays login form and is instantiated from the [buildAppBar]
class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[700],
        title: Text('Login'),
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
              child: TextFormField(
                validator: (val) => val.isEmpty ? 'Please enter some text' : '',
                decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 0.5, color: Colors.teal),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                obscureText: true,
                validator: (val) => val.isEmpty ? 'Please enter some text' : '',
                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 0.5, color: Colors.teal),
                  ),
                ),
              ),
            ),
            MaterialButton(
              padding: EdgeInsets.all(8.0),
              onPressed: () => {},
              child: Text("Submit"),
            )
          ],
        ),
      ),
    );
  }
}
