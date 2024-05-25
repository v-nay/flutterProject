import 'package:flutter/material.dart';
import 'package:flutter_udemy_clone_project/Services/Constants.dart';
import 'package:flutter_udemy_clone_project/Services/PrefStorage.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  final PrefStorage prefStorage = PrefStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text(
          "Account",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.grey[100],
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: ListView(
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30.0,
                  backgroundImage: AssetImage('assets/images/user_image.jpeg'),
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Binaya Mhr",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Binayamhr@gmail.com",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(thickness: 1.0),
          ListTile(
            leading: Icon(Icons.person, color: Colors.black),
            title: Text("Profile"),
            onTap: () {
              // Navigate to profile settings
            },
          ),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.black),
            title: Text("Settings"),
            onTap: () {
              // Navigate to settings
            },
          ),
          ListTile(
            leading: Icon(Icons.notifications, color: Colors.black),
            title: Text("Notifications"),
            onTap: () {
              // Navigate to notifications settings
            },
          ),
          ListTile(
            leading: Icon(Icons.payment, color: Colors.black),
            title: Text("Payment Methods"),
            onTap: () {
              // Navigate to payment methods
            },
          ),
          ListTile(
            leading: Icon(Icons.help, color: Colors.black),
            title: Text("Help"),
            onTap: () {
              // Navigate to help section
            },
          ),
          ListTile(
            leading: Icon(Icons.logout, color: Colors.red),
            title: Text("Logout"),
            onTap: () {
              // Handle logout
            },
          ),
        ],
      ),
    );
  }
}
