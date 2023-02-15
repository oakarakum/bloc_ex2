import 'package:bloc_ex/first_page.dart';
import 'package:bloc_ex/state_management/typer_cubit/screen.dart';
import 'package:bloc_ex/state_management/vb_ex/bloc_cats_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocCatsView(),
    );
  }
}
