import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = "Album Information";

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(title: const Text(appTitle)),
        body: const SingleChildScrollView(
          child: Column(
            children: [
              ImageSection(image: "assets/albumCover.jpg"),
              TitleSection(
                album: "Melonhead Dreams",
                artistName: "Meloon Dogg",
              ),
              ButtonSection(),
              TextSection(
                description:
                  "Drifting through sun-drenched haze and fruity mirages,"
                  " 'Melonhead Dreams' is the debut psychedelic journey of Melon Dogg."
                  " Blending shimmering guitar riffs, swirling synths, and a laid-back bark of rhythm,"
                  " this album is a sonic vacation into a world where nothing makes sense—"
                  " and that's exactly the point."
                  " Each track flows like melted ice cream on hot pavement,"
                  " evoking beachside nostalgia, neon-colored confusion, and the gentle chaos of a dream you almost remember."
                  " It's summer, it's strange, it's sweet—"
                  " welcome to the melonverse."
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TitleSection extends StatelessWidget {
  const TitleSection({
    super.key,
    required this.album,
    required this.artistName,
  });

  final String album;
  final String artistName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    album,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(artistName, style: TextStyle(color: Colors.grey[500])),
              ],
            ),
          ),
          /*3*/
          Icon(Icons.favorite, color: Colors.green[600]),
          const Text(' 419k'),
        ],
      ),
    );
  }
}

class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    final Color? color = Colors.green[800];
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ButtonWithText(color: color, icon: Icons.person, label: 'ARTIST'),
          FavoriteButton(color: color),
          ButtonWithText(color: color, icon: Icons.share, label: 'SHARE'),
        ],
      ),
    );
  }
}

class ButtonWithText extends StatelessWidget {
  const ButtonWithText({
    super.key,
    required this.color,
    required this.icon,
    required this.label,
  });

  final Color? color;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({super.key, required this.color});

  final Color? color;

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorited = false;

  void toggleFavorite() {
    setState(() {
      isFavorited = !isFavorited;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggleFavorite,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            isFavorited ? Icons.favorite : Icons.favorite_border,
            color: widget.color,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              'FAVORITE',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: widget.color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TextSection extends StatelessWidget {
  const TextSection({super.key, required this.description});

  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Text(description, softWrap: true, textAlign: TextAlign.justify),
    );
  }
}

class ImageSection extends StatelessWidget {
  const ImageSection({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Image.asset(image, width: 600, height: 300, fit: BoxFit.cover);
  }
}