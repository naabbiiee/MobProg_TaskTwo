import 'package:flutter/material.dart';
import 'package:tasknumbtwo/home.dart';

void main() {
  runApp(MaterialApp(
   debugShowCheckedModeBanner: false,
    title: "ToDos",
    theme: ThemeData(
      primarySwatch: Colors.brown,
    ),
    home: const Home(),
  ));
}