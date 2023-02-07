import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: const HomePage(),
  ));
}

// ! Creating a HomePage.
// * Scaffold - We need a scaffold inside our HomePage widget to make it presentable
/*
      * add an appBar inside the scaffold 
        ? inside the AppBar pass a title parameter 
  */
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
      ), // Create a new instance of AppBar()
    );
  }
}
