import 'package:flutter/material.dart';

class CustomWidget extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController dataTypeController;
  final Widget visibilityDropDown;
  final Widget rebuildDropDown;
  final String currentWidgetCount;

  CustomWidget({
    @required this.nameController,
    @required this.dataTypeController,
    @required this.visibilityDropDown,
    @required this.rebuildDropDown,
    @required this.currentWidgetCount,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 20,
        ),
        TextFormField(
          controller: this.nameController,
          style: TextStyle(
            fontFamily: 'monospace',
          ),
          decoration: InputDecoration(
            hintText: 'Name $currentWidgetCount',
            labelText: 'Name',
          ),
        ),
        TextFormField(
          controller: this.dataTypeController,
          style: TextStyle(
            fontFamily: 'monospace',
          ),
          decoration: InputDecoration(
            hintText: 'Datatype (Default: dynamic)',
            labelText: 'DataType',
          ),
        ),
        visibilityDropDown,
        rebuildDropDown,
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
