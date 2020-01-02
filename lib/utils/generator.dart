import 'package:flutter/material.dart';

import 'package:dexter/screens/home/widgets/textformfield.dart';

String viewModelGenerator({
  @required List<Widget> dynamicWidgets,
  @required String className,
}) {
  String output = 'import \'package:provider/provider.dart\';\n';
  output +=
      '\nclass ${className.isEmpty ? '_ClassName' : className} with ChangeNotifier {';
  output += dynamicWidgets.map(
    (_dynamicWidget) {
      TextFormFieldWidget dynamicWidget = _dynamicWidget;
      final name =
          (dynamicWidget.visibilityController.text == 'public' ? '' : '_') +
              dynamicWidget.nameController.text;
      final dataType = dynamicWidget.dataTypeController.text == ''
          ? 'dynamic'
          : dynamicWidget.dataTypeController.text;
      return '''
\n    $dataType $name;
${dynamicWidget.visibilityController.text != 'public' ? '''
\n    $dataType get ${dynamicWidget.nameController.text} => this.$name;
\n    set ${dynamicWidget.nameController.text}($dataType $name) {
        this.$name = $name;${dynamicWidget.rebuildController.text == 'false' ? '' : '\n        notifyListeners();'}
    }''' : ''}
''';
    },
  ).join('');
  output += '}';
  return output;
}
