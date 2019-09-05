import 'package:flutter/material.dart';
import '../utils/colors.dart';

class VideoCard extends StatelessWidget {
  final video;

  const VideoCard({Key key, @required this.video}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    final BorderRadius br = BorderRadius.circular(20.0);

    final playIcon = Positioned(
      bottom: 12.0,
      left: 12.0,
      child: Material(
        elevation: 4.0,
        borderRadius: BorderRadius.circular(8.0),
        child: Container(
          height: 35.0,
          width: 35.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Colors.white,
          ),
          child: Center(
            child: Icon(Icons.play_arrow),
          ),
        ),
      ),
    );

    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0, right: 10.0),
      child: Material(
        elevation: 4.0,
        borderRadius: br,
        child: Stack(
          children: <Widget>[
            Container(
              width: screenWidth * 0.5,
              height: screenWidth * 0.3,
              decoration: BoxDecoration(
                color: CustomColors.unselectedCardColor,
                borderRadius: br,
                image: DecorationImage(
                  image: AssetImage(video),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            playIcon
          ],
        ),
      ),
    );
  }
}
