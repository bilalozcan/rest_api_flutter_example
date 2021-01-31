import 'package:flutter/material.dart';
import 'package:rest_api_flutter_example/ui/myhome_page.dart';
import 'package:rest_api_flutter_example/ui/profile_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(),
        '/profile': (context) => ProfilePage(),
      },
      title: 'Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}