import 'package:flutter/material.dart';

import 'package:dexter/screens/home/widgets/custom_widget.dart';
import 'package:dexter/screens/home/widgets/dropdown_formfield.dart';

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
    CustomWidget(
      nameController: TextEditingController(),
      dataTypeController: TextEditingController(),
      visibilityDropDown: DropdownButtonFormFieldWidget(
        items: ['private', 'public'],
        labelText: 'Visibility',
      ),
      rebuildDropDown: DropdownButtonFormFieldWidget(
        items: ['Yes', 'No'],
        labelText: 'Rebuild - notifyListeners();',
      ),
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
