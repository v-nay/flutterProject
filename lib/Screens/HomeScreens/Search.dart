import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController searchController = TextEditingController();
  late QuerySnapshot snapshot;
  bool isExecuted = false;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    Widget searchedResult() {
      return ListView.builder(
        itemCount: snapshot.docs.length,
        itemBuilder: (BuildContext context, int index) {
          var courseData = snapshot.docs[index].data() as Map<String, dynamic>;
          return GestureDetector(
            onTap: () {
              // Navigate to course details
              // Navigator.push(context, MaterialPageRoute(builder: (_) => DetailsScreen(course: snapshot.docs[index])));
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 110.0,
                width: 150.0,
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: FadeInImage(
                          height: 90.0,
                          width: 150.0,
                          fit: BoxFit.fill,
                          image: NetworkImage(courseData['image']),
                          placeholder: AssetImage("assets/images/java.jpeg"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 220.0,
                              child: Text(
                                courseData['title'],
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.grey.shade300,
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                            Text(
                              courseData['author'],
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
                                Icon(Icons.star, color: Colors.yellow, size: 18.0),
                                Text(
                                  courseData['ratings'].toString(),
                                  style: TextStyle(
                                    color: Colors.grey.shade500,
                                    fontSize: 14.0,
                                  ),
                                ),
                                Text(
                                  " (${courseData['enrolled']})",
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
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: Colors.grey[700], // Set the background color of the Scaffold to grey
      appBar: AppBar(
        title: TextField(
          controller: searchController,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
          ),
          decoration: InputDecoration(
            hintText: "Search Courses",
            hintStyle: TextStyle(
              color: Colors.grey[700],
              fontSize: 20.0,
            ),
          ),
          onSubmitted: (query) {
            setState(() {
              isLoading = true;
            });
            FirebaseFirestore.instance
                .collection('courses')
                .where('title', isGreaterThanOrEqualTo: query)
                .get()
                .then((value) {
              setState(() {
                snapshot = value;
                isExecuted = true;
                isLoading = false;
              });
            });
            FocusScope.of(context).unfocus();
          },
        ),
        backgroundColor: Colors.grey[100],
        actions: [
          isLoading
              ? Center(
            child: CircularProgressIndicator(),
          )
              : IconButton(
            icon: Icon(Icons.clear),
            onPressed: () {
              searchController.clear();
              setState(() {
                isExecuted = false;
              });
            },
          ),
        ],
      ),
      body: isLoading
          ? Center(
        child: CircularProgressIndicator(),
      )
          : isExecuted
          ? snapshot.docs.isEmpty
          ? Center(
        child: Text(
          "No Courses Found",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25.0,
          ),
        ),
      )
          : searchedResult()
          : Center(
        child: Text(
          "Search any Courses",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25.0,
          ),
        ),
      ),
    );
  }
}
