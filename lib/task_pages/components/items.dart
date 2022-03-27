import 'package:flutter/material.dart';

class Itmes extends StatelessWidget {
  const Itmes(
      {Key? key,
      required this.playlist_images_url,
      required this.size,
      required this.playlist_names,
      required this.playlist_song_count,
      required this.playlist_likes,
      required this.index})
      : super(key: key);

  final playlist_images_url;
  final Size size;
  final playlist_names;
  final playlist_song_count;
  final playlist_likes;
  final index;
  static const shadow =
      BoxShadow(offset: Offset(0, 15), blurRadius: 27, color: Colors.black12);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(22)),
        // color: Colors.purpleAccent,
      ),
      // color: Colors.purpleAccent,
      height: 160,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Container(
            height: 160,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              color: index.isEven ? Colors.pinkAccent : Colors.purple,
              boxShadow: const [shadow],
            ),
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              height: 160,
              width: 200,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(22),
                    topLeft: Radius.circular(22)),
                child: Image(
                  image: NetworkImage(playlist_images_url[index]),
                  fit: BoxFit.fitHeight,
                  alignment: Alignment.bottomLeft,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: SizedBox(
              height: 160,
              width: size.width - 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      playlist_names[index],
                      style: Theme.of(context).textTheme.button,
                    ),
                  ),
                  // Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                    ),
                    child:
                        Text('Number of Songs: ${playlist_song_count[index]}'),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5,
                      vertical: 2,
                    ),
                    child: Text('Number of Likes: ${playlist_likes[index]}'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
