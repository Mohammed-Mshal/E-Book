import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_project/Componeants/SeeAlso.dart';
import 'package:my_project/Pages/DescriptionBook.dart';
import 'package:my_project/Componeants/RecentBookData.dart';
import 'package:my_project/Pages/Welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // أزالة العلامة التجريب
        debugShowCheckedModeBanner: false,
        title: 'E-Book',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Welcome());
  }
}

