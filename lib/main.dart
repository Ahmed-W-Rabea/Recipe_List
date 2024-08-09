import 'package:flutter/material.dart';
import 'package:recipe_list/views/widgets/home_page.dart';

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
      title: 'Food Recipe',
      theme: ThemeData(
        primarySwatch:  Colors.blue,
        primaryColor: Colors.white,
        textTheme: TextTheme(
          
          
          
        
        )
      ),
   
      home: HomePage(),
    );
  }
}

