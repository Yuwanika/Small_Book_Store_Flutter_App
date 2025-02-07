import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 123, 9, 49),
            ),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 40.0,
                  backgroundImage: AssetImage('assets/images/profile_photo.jpg'),
                ),
                SizedBox(height: 10),
                Text(
                  'Yuwanika',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                  ),
                ),
              ],
            ),
          ),
          _buildDrawerItem(context, 'Home', Icons.home, '/'),
          _buildDrawerItem(context, 'Cart', Icons.shopping_cart, '/cart'),
          _buildDrawerItem(context, 'Profile', Icons.person, '/profile'),
        ],
      ),
    );
  }

  
  Widget _buildDrawerItem(BuildContext context, String title, IconData icon, String route) {
    return InkWell(
      onTap: () {
        Navigator.pushReplacementNamed(context, route);
      },
      child: Material(
        color: const Color.fromARGB(0, 239, 236, 236),
        child: ListTile(
          leading: Icon(icon, color: const Color.fromARGB(255, 123, 9, 49)),
          title: Text(title, style: TextStyle(color: Colors.black)),
          hoverColor: const Color.fromARGB(255, 20, 16, 17), 
        ),
      ),
    );
  }
}
