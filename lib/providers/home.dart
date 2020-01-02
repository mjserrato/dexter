import 'package:flutter/material.dart';

import 'package:dexter/screens/home/widgets/textformfield.dart';

class HomeProvider with ChangeNotifier {
  //
  int _count = 1;

  int get count => this._count;

  set count(int _count) {
    this._count = _count;
    notifyListeners();
  }

  //
  List<Widget> _dynamicWidgets = [
    TextFormFieldWidget(
      nameController: TextEditingController(),
      dataTypeController: TextEditingController(),
      visibilityController: TextEditingController(),
      rebuildController: TextEditingController(),
      currentWidgetCount: '1',
    ),
  ];

  List<Widget> get dynamicWidgets => this._dynamicWidgets;

  void addDynamicWidget(Widget _dynamicWidget) {
    this._dynamicWidgets.add(_dynamicWidget);
    notifyListeners();
  }

  void removeDynamicWidget(int _index) {
    this._dynamicWidgets.removeAt(_index);
    notifyListeners();
  }
}
