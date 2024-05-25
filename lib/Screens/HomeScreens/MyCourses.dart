import 'package:flutter/material.dart';
import 'package:flutter_udemy_clone_project/Services/Constants.dart';

class MyCourses extends StatefulWidget {
  @override
  _MyCoursesState createState() => _MyCoursesState();
}

class _MyCoursesState extends State<MyCourses> {
  final List<Map<String, String>> courses = [
    {
      'image': 'assets/images/flutter.png',
      'title': 'Flutter Development',
      'author': 'Merle Jane',
      'ratings': '4.5',
      'enrolled': '1200',
    },
    {
      'image': 'assets/images/react_image.webp',
      'title': 'React Native',
      'author': 'Ann',
      'ratings': '4.7',
      'enrolled': '980',
    },
    // Add more courses as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text("My Courses"),
        backgroundColor: Colors.white, // Set app bar background color
        elevation: 0, // Remove app bar elevation
      ),
      body: ListView.builder(
        itemCount: courses.length,
        itemBuilder: (BuildContext context, int index) {
          var course = courses[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white, // Set container background color
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5), // Add shadow color
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: ListTile(
                contentPadding: EdgeInsets.all(10.0),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: course['image']!.startsWith('http')
                      ? Image.network(
                    course['image']!,
                    height: 90.0,
                    width: 90.0,
                    fit: BoxFit.cover,
                  )
                      : Image.asset(
                    course['image']!,
                    height: 90.0,
                    width: 80.0,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(
                  course['title']!,
                  style: TextStyle(
                    color: Colors.black, // Set text color
                    fontSize: 18.0,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      course['author']!,
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 14.0,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.yellow, size: 18.0),
                        Icon(Icons.star, color: Colors.yellow, size: 18.0),
                        Icon(Icons.star, color: Colors.yellow, size: 18.0),
                        Icon(Icons.star, color: Colors.yellow, size: 18.0),
                        Icon(Icons.star_half, color: Colors.yellow, size: 18.0),
                        Text(
                          course['ratings']!,
                          style: TextStyle(
                            color: Colors.grey.shade500,
                            fontSize: 14.0,
                          ),
                        ),
                        Text(
                          " (${course['enrolled']})",
                          style: TextStyle(
                            color: Colors.grey.shade500,
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
