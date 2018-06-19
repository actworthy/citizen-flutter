import 'package:flutter/material.dart';

/// Provides a checkbox with a text label to the right. Currently
/// tracks checked vs unchecked via [value] and Flutter's vanilla
/// [StatefulWidget] (ie. -> no Redux)
class LabeledCheckbox extends StatefulWidget {
  String label;
  bool value;

  LabeledCheckbox({
    @required this.label,
    @required this.value,
  });

  @override
  State<LabeledCheckbox> createState() {
    return LabeledCheckboxState();
  }
}

class LabeledCheckboxState extends State<LabeledCheckbox> {
  @override
  Row build(BuildContext context) {
    return Row(
      children: <Widget>[
        Checkbox(
          value: widget.value,
          onChanged: (value) {
            setState(() => widget.value = value);
          },
        ),
        Text(widget.label),
      ],
    );
  }
}
