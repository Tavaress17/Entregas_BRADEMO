import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            children: const [
              GridCard(imagePath: 'assets/image1.jpg', title: 'Thumbs Up for the Chaos', subtitle: '7 MusicSong (s)'),
              GridCard(imagePath: 'assets/image2.jpg', title: 'Feline Confidence', subtitle: '6 MusicSong (s)'),
              GridCard(imagePath: 'assets/image3.jpg', title: 'Code Borked', subtitle: '10 MusicSong (s)'),
              GridCard(imagePath: 'assets/image4.jpg', title: 'Melonhead Dreams', subtitle: '1 MusicSong (s)'),
              GridCard(imagePath: 'assets/image5.jpg', title: 'Void Gazer', subtitle: '11 MusicSong (s)'),
              GridCard(imagePath: 'assets/image6.jpg', title: 'Screams and Likes', subtitle: '13 MusicSong (s)'),
              GridCard(imagePath: 'assets/image7.jpg', title: 'Puppy Regression', subtitle: '17 MusicSong (s)'),
              GridCard(imagePath: 'assets/image8.jpg', title: 'Professor Paw', subtitle: '4 MusicSong (s)'),
            ],
          ),
        ),
      ),
    );
  }
}

class GridCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;

  const GridCard({
    required this.imagePath,
    required this.title,
    required this.subtitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              color: Colors.black.withValues(alpha: 0.6),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(
                    subtitle,
                    style: const TextStyle(color: Colors.white70, fontSize: 13),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}