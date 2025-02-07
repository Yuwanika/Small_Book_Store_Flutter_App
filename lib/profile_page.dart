import 'package:flutter/material.dart';
import 'app_drawer.dart';

class ProfilePage extends StatelessWidget {
  final String userName = "Yuwanika Samarawickrama";
  final String email = "yuwanikaiwanthi@gmail.com";
  final String phone = "+94 705342583";
  final String shippingAddress = "Baddegama,Galle,Sri Lanka";
  final String town = "Galle";
  final String birthday = "1999-05-31";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile',style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255))),
        backgroundColor: const Color.fromARGB(255, 123, 9, 49),
          iconTheme: IconThemeData(
          color: Colors.white,
      ),
      ),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundColor: const Color.fromARGB(255, 123, 9, 49),
                      child: CircleAvatar(
                        radius: 60,
                        backgroundImage:
                            AssetImage('assets/images/profile_photo.jpg'),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      userName,
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              buildProfileBox(Icons.email, "Email", email),
              buildProfileBox(Icons.phone, "Phone", phone),
              buildProfileBox(Icons.home, "Shipping Address", shippingAddress),
              buildProfileBox(Icons.location_city, "Town", town),
              buildProfileBox(Icons.cake, "Birthday", birthday),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 81, 7, 2),
                  padding: EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical:
                          10),
                ),
                child: Text("Log Out",
                    style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildProfileBox(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
          SizedBox(height: 5),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 235, 228, 228),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color.fromARGB(255, 235, 228, 228)),
            ),
            child: Row(
              children: [
                Icon(icon, color: Colors.black),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    value,
                    style: TextStyle(
                        fontSize: 16, color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

