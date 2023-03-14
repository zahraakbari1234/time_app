import 'package:flutter/material.dart';
import 'package:time_app/pages/homepage.dart';
import 'package:time_app/pages/loading.dart';
import 'package:time_app/pages/choose_location.dart';

void main() {
  runApp(
     MaterialApp(
       debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => Home(),
        '/choose_location': (context) => ChooseLocation(),

      },
    ),
);

}

