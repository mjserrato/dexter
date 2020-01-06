import 'package:flutter/material.dart';

import 'package:dexter/screens/home/widgets/custom_widget.dart';
import 'package:dexter/screens/home/widgets/dropdown_formfield.dart';

String viewModelGenerator({
  @required List<Widget> dynamicWidgets,
  @required String className,
}) {
  String output = 'import \'package:flutter/material.dart\';\n';
  output +=
      '\nclass ${className.isEmpty ? 'ClassName' : className} with ChangeNotifier {';
  output += dynamicWidgets.map(
    (_dynamicWidget) {
      CustomWidget dynamicWidget = _dynamicWidget;
      final name = ((dynamicWidget.visibilityDropDown
                      as DropdownButtonFormFieldWidget)
                  .currentValue ==
              'public'
          ? '${(dynamicWidget.nameController.text.isEmpty ? '_' : dynamicWidget.nameController.text)}'
          : '_${dynamicWidget.nameController.text}');
      final dataType = dynamicWidget.dataTypeController.text == ''
          ? 'dynamic'
          : dynamicWidget.dataTypeController.text;
      return '''
\n    $dataType $name;
${(dynamicWidget.visibilityDropDown as DropdownButtonFormFieldWidget).currentValue != 'public' ? '''
\n    $dataType get ${dynamicWidget.nameController.text} => this.$name;
\n    set ${dynamicWidget.nameController.text}($dataType $name) {
        this.$name = $name;${(dynamicWidget.rebuildDropDown as DropdownButtonFormFieldWidget).currentValue == 'No' ? '' : '\n        notifyListeners();'}
    }''' : ''}
''';
    },
  ).join('');
  output += '}';
  return output;
}
