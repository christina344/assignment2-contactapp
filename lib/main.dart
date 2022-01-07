import 'package:contact_app/pages/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ContactApp());
}

class ContactApp extends StatelessWidget {
  const ContactApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'Contact App',
      theme: CupertinoThemeData(
        primaryColor: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
