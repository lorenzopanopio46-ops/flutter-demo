import 'package:flutter/material.dart';

import 'pages/login_page.dart';

// Main function Entry for flutter
void main(){
  runApp(MyApp());
}

// Root widget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,

      theme: ThemeData(
        primaryColor: Colors.pink,
      ),
      home:LoginPage()
    );
  }
}