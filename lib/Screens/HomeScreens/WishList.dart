import 'package:flutter/material.dart';
import 'package:flutter_udemy_clone_project/Services/Constants.dart';

class WishList extends StatefulWidget {
  const WishList({super.key});

  @override
  _WishListState createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  final List<Map<String, String>> wishlist = [
    {
      'image': 'https://via.placeholder.com/150',
      'title': 'Flutter Development',
      'author': 'will smith',
    },
    {
      'image': 'https://via.placeholder.com/150',
      'title': 'React Native',
      'author': 'Jane Smith',
    },
    // Add more courses as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text(
          "My Wishlist",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.grey[100],
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: wishlist.isEmpty
          ? Center(
        child: Text(
          "No items in Wishlist",
          style: TextStyle(
            color: Colors.black,
            fontSize: 25.0,
          ),
        ),
      )
          : ListView.builder(
        itemCount: wishlist.length,
        itemBuilder: (BuildContext context, int index) {
          var course = wishlist[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ListTile(
                contentPadding: EdgeInsets.all(10.0),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: Image.network(
                    course['image']!,
                    height: 90.0,
                    width: 90.0,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(
                  course['title']!,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                  ),
                ),
                subtitle: Text(
                  course['author']!,
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 14.0,
                  ),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    setState(() {
                      wishlist.removeAt(index);
                    });
                  },
                ),
                onTap: () {
                  // Navigate to course details
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
