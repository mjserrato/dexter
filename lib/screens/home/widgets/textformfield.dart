import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:dexter/providers/home.dart';

class TextFormFieldWidget extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController dataTypeController;
  final TextEditingController visibilityController;
  final TextEditingController rebuildController;
  final String currentWidgetCount;

  TextFormFieldWidget({
    @required this.nameController,
    @required this.dataTypeController,
    @required this.visibilityController,
    @required this.rebuildController,
    @required this.currentWidgetCount,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (_, homeProvider, __) => Column(
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
          TextFormField(
            controller: this.visibilityController,
            style: TextStyle(
              fontFamily: 'monospace',
            ),
            decoration: InputDecoration(
              hintText: 'Visibility (Default: private)',
              labelText: 'Visibility',
            ),
          ),
          TextFormField(
            controller: this.rebuildController,
            style: TextStyle(
              fontFamily: 'monospace',
            ),
            decoration: InputDecoration(
              hintText: 'Rebuild (Default: true)',
              labelText: 'Rebuild',
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
