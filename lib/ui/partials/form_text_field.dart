import 'package:flutter/material.dart';

/// Builds a [TextFormField] in a unified style that matches ActWorthy's design.
///
/// If [focusOnSubmit] is provided, then [context] **must** be provided and
/// [onFieldSubmitted] must be null.
///
/// Most of the parameters accepted by this function come directly from
/// [TextFormField]. See that class for information on those parameters.
TextFormField buildTextFormField(
    {Key key,
    String labelText,
    BuildContext context,
    FocusNode focusNode,

    /// Providing this node and [context] will trigger the IME keyboard submit
    /// button to focus this node rather than trying to validate the form, etc.
    FocusNode focusOnSubmit,
    bool autocorrect = true,
    bool obscureText = false,
    FormFieldValidator<String> validator,
    InputDecoration decoration,

    /// If this is provided, [focusOnSubmit] must be null.
    ValueChanged<String> onFieldSubmitted}) {
  assert(onFieldSubmitted == null || focusOnSubmit == null);
  if (focusOnSubmit != null) assert(context != null);

  return TextFormField(
    key: key,
    focusNode: focusNode,
    autocorrect: autocorrect,
    obscureText: obscureText,
    validator: validator,
    decoration: InputDecoration(
      labelText: labelText,
      border: OutlineInputBorder(
        borderSide: BorderSide(width: 0.5, color: Colors.teal),
      ),
    ),
    onFieldSubmitted: (value) => (focusOnSubmit != null)
        ? FocusScope.of(context).requestFocus(focusOnSubmit)
        : onFieldSubmitted,
  );
}
