import 'package:flutter/material.dart';

/// Provides a checkbox with a text label to the right. Currently
/// tracks checked vs unchecked via [value] and Flutter's vanilla
/// [StatefulWidget] (ie. -> no Redux)
class LabeledCheckbox extends StatefulWidget {
  final String label;
  final bool value;

  LabeledCheckbox({
    @required this.label,
    @required this.value,
  });

  @override
  State<LabeledCheckbox> createState() {
    return LabeledCheckboxState(this.value);
  }
}

class LabeledCheckboxState extends State<LabeledCheckbox> {
  bool value;

  LabeledCheckboxState(this.value);

  @override
  Row build(BuildContext context) {
    return Row(
      children: <Widget>[
        Checkbox(
          value: this.value,
          onChanged: (value) {
            setState(() => this.value = value);
          },
        ),
        Text(widget.label),
      ],
    );
  }
}
