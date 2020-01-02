import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:dexter/providers/home.dart';
import 'package:dexter/screens/home/home.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<HomeProvider>(
            create: (context) => HomeProvider(),
          ),
        ],
        child: kIsWeb
            ? MyApp()
            : Material(
                child: Text('Curretly only web is supported.'),
              ),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dexter - ViewModel Generator',
      initialRoute: '/',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        accentColor: Colors.pinkAccent,
      ),
      routes: {
        '/': (context) => HomeScreen(),
      },
    );
  }
}
