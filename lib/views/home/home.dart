import 'package:flutter/material.dart';
import 'package:flutter_ghana_ui_challenge_week_1/widgets/custom_text.dart';
import 'widgets/tab_section.dart';
import 'widgets/tile_section.dart';
import '../../widgets/media_section.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/header.dart';
import '../../utils/utils.dart';

class HomePage extends StatelessWidget {
  final List<String> _photos = [
    "",
    AvailableImages.bleach,
    AvailableImages.saitama,
    AvailableImages.luffy,
    AvailableImages.naruto,
    AvailableImages.natsu,
    AvailableImages.mikasa,
  ];

  final List<String> _videos = [
    AvailableImages.rom,
    AvailableImages.rom2,
  ];

  @override
  Widget build(BuildContext context) {
    final _headerText = Header(isHome: true);

    final _descriptionText = CustomText(
      text: "Sed ut amnet dolor",
      size: 18.00,
      weight: FontWeight.w500,
    );

    final _tileSection = TileSection();

    final _tabSection = TabSection();

    final _photosSection = MediaSection(title: "My Photos", media: _photos);

    final _videosSection =
        MediaSection(title: "My Videos", media: _videos, isPhoto: false);

    return Scaffold(
      appBar: CustomAppBar(isHome: true),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Container(
            padding: EdgeInsets.only(top: 0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _headerText,
                _descriptionText,
                _tileSection,
                _tabSection,
                _photosSection,
                _videosSection
              ],
            ),
          ),
        ),
      ),
    );
  }
}
