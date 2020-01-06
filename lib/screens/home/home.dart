import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:demoji/demoji.dart';

import 'package:dexter/providers/home.dart';
import 'package:dexter/screens/home/widgets/custom_widget.dart';
import 'package:dexter/screens/home/widgets/dropdown_formfield.dart';
import 'package:dexter/utils/generator.dart';

class HomeScreen extends StatelessWidget {
  final TextEditingController _outputController = TextEditingController();
  final TextEditingController _classNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (_, homeProvider, __) => Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              onPressed: () {
                showAboutDialog(
                  context: context,
                  applicationIcon: Image.asset(
                    'assets/images/logo.png',
                    height: 50,
                    width: 50,
                  ),
                  applicationName: 'Dexter',
                  applicationVersion: '0.0.1',
                  children: [
                    Text("ViewModel Generator"),
                    Text(
                      "\nMade with \u2764 by Tirth",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ],
                );
              },
              icon: Icon(Icons.info_outline),
            ),
          ],
          leading: Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () async {
                if (_outputController.text == '' && homeProvider.count == 1) {
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Nothing to clear!'),
                    ),
                  );
                } else {
                  await showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('${Demoji.warning} Warning'),
                      content: Text('Do you want to clear everything?'),
                      actions: <Widget>[
                        FlatButton(
                          child: Text('Cancel'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        FlatButton(
                          child: Text('Sure'),
                          onPressed: () {
                            _outputController.clear();
                            final first = homeProvider.dynamicWidgets[0];
                            homeProvider.dynamicWidgets
                                .removeRange(0, homeProvider.count);
                            homeProvider.addDynamicWidget(first);
                            homeProvider.count = 1;
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          ),
          title: Text('Dexter - ViewModel Generator'),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            _outputController.text = viewModelGenerator(
              dynamicWidgets: homeProvider.dynamicWidgets,
              className: _classNameController.text,
            );
          },
          label: Text('Generate'),
          icon: Icon(Icons.build),
        ),
        body: Container(
          margin: EdgeInsets.all(16),
          child: Row(
            children: <Widget>[
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller: _classNameController,
                        decoration: InputDecoration(
                          hintText: 'Class Name',
                          labelText: 'Class Name',
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      ...homeProvider.dynamicWidgets,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          RaisedButton(
                            onPressed: () {
                              homeProvider.count++;
                              homeProvider.addDynamicWidget(
                                CustomWidget(
                                  nameController: TextEditingController(),
                                  dataTypeController: TextEditingController(),
                                  visibilityDropDown:
                                      DropdownButtonFormFieldWidget(
                                    items: ['private', 'public'],
                                    labelText: 'Visibility',
                                  ),
                                  rebuildDropDown:
                                      DropdownButtonFormFieldWidget(
                                    items: ['Yes', 'No'],
                                    labelText: 'Rebuild - notifyListeners();',
                                  ),
                                  currentWidgetCount:
                                      homeProvider.count.toString(),
                                ),
                              );
                            },
                            child: Text('Add'),
                          ),
                          RaisedButton(
                            onPressed: () {
                              print(homeProvider.count);
                              if (homeProvider.count > 1) {
                                homeProvider.count--;
                                homeProvider
                                    .removeDynamicWidget(homeProvider.count);
                              }
                            },
                            child: Text('Remove'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: TextFormField(
                    controller: _outputController,
                    style: TextStyle(
                      fontFamily: 'monospace',
                    ),
                    decoration: InputDecoration(
                      hintText: 'Your ViewModel',
                    ),
                    maxLines: 30,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
