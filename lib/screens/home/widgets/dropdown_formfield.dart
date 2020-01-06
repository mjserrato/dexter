import 'package:flutter/material.dart';

class DropdownButtonFormFieldWidget extends StatefulWidget {
  final List<String> items;
  final String labelText;
  String currentValue;

  DropdownButtonFormFieldWidget({
    @required this.items,
    @required this.labelText,
  });

  @override
  _DropdownButtonFormFieldWidgetState createState() =>
      _DropdownButtonFormFieldWidgetState();
}

class _DropdownButtonFormFieldWidgetState
    extends State<DropdownButtonFormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: widget.currentValue ?? widget.items[0],
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: TextStyle(
          fontFamily: 'monospace',
        ),
      ),
      items: [
        ...widget.items.map(
          (widget) => DropdownMenuItem(
            child: Text(
              widget,
              style: TextStyle(
                fontFamily: 'monospace',
              ),
            ),
            value: widget,
          ),
        ),
      ],
      onChanged: (newValue) {
        setState(() {
          widget.currentValue = newValue;
        });
      },
    );
  }
}
