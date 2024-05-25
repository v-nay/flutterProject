import 'package:flutter/material.dart';
import 'package:flutter_udemy_clone_project/Services/Constants.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_udemy_clone_project/Services/add_new_card.dart';
import 'package:flutter_udemy_clone_project/Services/video_player.dart';



class DisplayCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var heading = 'Flutter Beginner Course';
    var subheading = 'USD 199.00';
    // var cardImage = Image.asset('assets/images/ecourses_featured.png');
    var supportingText =
        'Beautiful home to rent, recently refurbished with modern appliances...';
    return Card(
        elevation: 4.0,
        child: Column(
          children: [
            ListTile(
              title: Text(heading),
              subtitle: Text(subheading),
              trailing: Icon(Icons.favorite_outline),
            ),
            Container(
              height: 150.0,
              child: Ink.image(
                image: AssetImage("assets/images/ecourses_featured.png"),
                fit: BoxFit.cover,
              ),
            ),
            // Container(
            //   padding: EdgeInsets.all(16.0),
            //   alignment: Alignment.centerLeft,
            //   child: Text(supportingText),
            // ),
            ButtonBar(
              children: [
                TextButton(
                  child: const Text('Buy Now'),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      PageTransition(
                          child: AddNewCardScreen(),
                          type: PageTransitionType.leftToRightWithFade),
                    );
                  },
                ),
                TextButton(
                  child: const Text('LEARN MORE'),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      PageTransition(
                          child: VideoPlayerWidget(),
                          type: PageTransitionType.leftToRightWithFade,
                      ),
                    );
                  },
                )
              ],
            )
          ],
        ));
  }
}