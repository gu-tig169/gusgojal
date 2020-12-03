import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'MainView.dart';
import 'Model.dart';

void main() {
  var state = Model();
  state.getList();

  runApp(
    ChangeNotifierProvider(
      create: (context) => state,
      child:  MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: MainView(),
    );
  }
}