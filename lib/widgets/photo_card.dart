import 'package:flutter/material.dart';
import '../utils/colors.dart';

class PhotoCard extends StatelessWidget {
  final String photo;

  const PhotoCard({Key key, @required this.photo}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    final BorderRadius br = BorderRadius.circular(20.0);

    final bool isPhoto = photo.isNotEmpty ? true : false;

    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0, right: 10.0),
      child: Material(
        elevation: isPhoto ? 4.0 : 0,
        borderRadius: br,
        child: Container(
          width: screenWidth * 0.3,
          height: screenWidth * 0.3,
          decoration: BoxDecoration(
              color: CustomColors.unselectedCardColor,
              borderRadius: br,
              image: isPhoto
                  ? DecorationImage(image: AssetImage(photo), fit: BoxFit.cover)
                  : null),
          child: isPhoto
              ? null
              : Center(
                  child: Icon(
                    Icons.add,
                    size: 40.0,
                    color: Colors.grey.withOpacity(0.4),
                  ),
                ),
        ),
      ),
    );
  }
}
