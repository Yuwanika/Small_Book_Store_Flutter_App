import 'package:flutter/material.dart';
import 'home_page.dart';
import 'cart_page.dart';
import 'profile_page.dart';
 
void main() { 
  runApp(BookStoreApp()); 
} 
 
class BookStoreApp extends StatelessWidget { 
  @override 
  Widget build(BuildContext context) { 
    return MaterialApp( 
      debugShowCheckedModeBanner: false, 
      initialRoute: '/', 
      routes: { 
        '/': (context) => HomePage(), 
        '/cart': (context) => BookCartPage(), 
        '/profile': (context) => ProfilePage(), 
      }, 
    ); 
  } 
} 
