import 'package:flutter/material.dart'; 
import 'books.dart'; 
import 'app_drawer.dart'; 
 
class HomePage extends StatelessWidget {
  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      appBar: AppBar( 
        title: Text('Home',style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255))),
        backgroundColor: const Color.fromARGB(255, 123, 9, 49), 
        iconTheme: IconThemeData(
          color: Colors.white,
      ), 
      ),
      drawer: AppDrawer(), 
      body: BookList(), 
    ); 
  } 
} 



