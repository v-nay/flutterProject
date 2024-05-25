import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_udemy_clone_project/Services/Constants.dart';

class VideoPlayerWidget extends StatefulWidget {
  const VideoPlayerWidget({Key? key}) : super(key: key);

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _videoPlayerController;
  bool _isPlaying = true;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.asset('assets/videos/intro.mp4')
      ..initialize().then((_) {
        setState(() {});
        _videoPlayerController.play();
      });
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  void _togglePlayPause() {
    setState(() {
      if (_videoPlayerController.value.isPlaying) {
        _videoPlayerController.pause();
        _isPlaying = false;
      } else {
        _videoPlayerController.play();
        _isPlaying = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text("Video Player"),
        leading: GestureDetector(
          child: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                AspectRatio(
                  aspectRatio: _videoPlayerController.value.aspectRatio,
                  child: VideoPlayer(_videoPlayerController),
                ),
                if (!_videoPlayerController.value.isPlaying)
                  Center(
                    child: IconButton(
                      icon: Icon(Icons.play_arrow, size: 64.0, color: Colors.white),
                      onPressed: _togglePlayPause,
                    ),
                  ),
                if (_videoPlayerController.value.isPlaying)
                  Center(
                    child: IconButton(
                      icon: Icon(Icons.pause, size: 64.0, color: Colors.white),
                      onPressed: _togglePlayPause,
                    ),
                  ),
              ],
            ),
            VideoProgressIndicator(
              _videoPlayerController,
              allowScrubbing: true,
              colors: VideoProgressColors(
                backgroundColor: Colors.grey,
                playedColor: kPrimaryColor,
                bufferedColor: Colors.lightGreen,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Course Title",
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow, size: 18.0),
                      Icon(Icons.star, color: Colors.yellow, size: 18.0),
                      Icon(Icons.star, color: Colors.yellow, size: 18.0),
                      Icon(Icons.star, color: Colors.yellow, size: 18.0),
                      Icon(Icons.star_half, color: Colors.yellow, size: 18.0),
                      SizedBox(width: 8.0),
                      Text(
                        "4.5",
                        style: TextStyle(fontSize: 16.0),
                      ),
                      SizedBox(width: 8.0),
                      Text(
                        "(1,234 ratings)",
                        style: TextStyle(fontSize: 16.0, color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    "Course Description: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(height: 24.0),
                  Text(
                    "Q&A",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  QandASection(),
                  SizedBox(height: 24.0),
                  Text(
                    "Reviews",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  ReviewsSection(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class QandASection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        QandAItem(
          question: "What is the course about?",
          answer: "This course provides an in-depth look at Flutter development.",
        ),
        QandAItem(
          question: "What are the prerequisites?",
          answer: "Basic knowledge of programming is recommended.",
        ),
      ],
    );
  }
}

class QandAItem extends StatelessWidget {
  final String question;
  final String answer;

  const QandAItem({required this.question, required this.answer});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
          SizedBox(height: 4.0),
          Text(answer),
        ],
      ),
    );
  }
}

class ReviewsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ReviewItem(
          reviewer: "John Doe",
          rating: 4.0,
          review: "Great course! I learned a lot.",
        ),
        ReviewItem(
          reviewer: "Jane Smith",
          rating: 5.0,
          review: "Highly recommend this course!",
        ),
      ],
    );
  }
}

class ReviewItem extends StatelessWidget {
  final String reviewer;
  final double rating;
  final String review;

  const ReviewItem({
    required this.reviewer,
    required this.rating,
    required this.review,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            reviewer,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
          Row(
            children: List.generate(5, (index) {
              return Icon(
                index < rating ? Icons.star : Icons.star_border,
                color: Colors.yellow,
                size: 18.0,
              );
            }),
          ),
          SizedBox(height: 4.0),
          Text(review),
        ],
      ),
    );
  }
}
