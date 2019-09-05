import 'package:flutter/material.dart';
import '../widgets/video_card.dart';
import '../router.dart';
import '../widgets/category_card.dart';
import '../widgets/photo_card.dart';
import '../utils/colors.dart';
import '../utils/utils.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  int selectedTabIndex = 0;
  final List<String> _tabs = [
    "CHAT",
    "FEATURED",
    "POPULAR",
    "FOLLOWERS",
    "LIKES"
  ];

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
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: _tabs.length);
  }

  int selectedCardIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final _userImage = GestureDetector(
      onTap: () => Navigator.pushNamed(context, notificationsViewRoute),
      child: Container(
        margin: EdgeInsets.only(right: 20.0, top: 20.0),
        height: 40.0,
        width: 37.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          image: DecorationImage(
            image: AssetImage(AvailableImages.assassin),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );

    final _appBar = AppBar(
      leading: Padding(
        padding: EdgeInsets.only(left: 10.0),
        child: GestureDetector(
          onTap: () => Navigator.pushNamed(context, notificationsViewRoute),
          child: Image.asset(
            AvailableImages.hamburger,
            width: 2.0,
            fit: BoxFit.contain,
          ),
        ),
      ),
      actions: <Widget>[_userImage],
    );

    final _headerText = Container(
      child: Text(
        "Feed",
        style: AppTextStyles.headerTextStyle,
      ),
    );

    final _descriptionText = Container(
      child: Text(
        "Sed ut amnet dolor",
        style: AppTextStyles.descriptionTextStyle,
      ),
    );

    final _categorySection = Container(
      padding: EdgeInsets.only(top: 30.0, bottom: 10.0),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _buildCategoryCard(0, CustomColors.orange, '24', 'photos', context),
            _buildCategoryCard(1, CustomColors.red, '48', 'articles', context),
            _buildCategoryCard(
                2, CustomColors.blue, '22k', 'followers', context),
          ],
        ),
      ),
    );

    final _tabSection = Container(
      padding: EdgeInsets.only(top: 30.0),
      child: TabBar(
        onTap: (index) {
          setState(() {
            selectedTabIndex = index;
          });
        },
        controller: tabController,
        unselectedLabelColor: Colors.grey.withOpacity(0.6),
        isScrollable: true,
        indicator: BoxDecoration(
          color: CustomColors.primaryColor.withOpacity(0.3),
          borderRadius: BorderRadius.circular(12.0),
        ),
        tabs: _tabs.map((tab) {
          var index = _tabs.indexOf(tab);
          return Tab(
            child: Text(
              tab,
              style: switchColor(index),
            ),
          );
        }).toList(),
      ),
    );

    final _photosSection = Container(
      padding: EdgeInsets.only(top: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "My photos",
            style: AppTextStyles.subHeaderTextStyle,
          ),
          SizedBox(height: 10.0),
          Container(
            height: screenWidth * 0.32,
            child: ListView.builder(
              itemCount: _photos.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                var photo = _photos[index];
                return PhotoCard(
                  photo: photo,
                );
              },
            ),
          )
        ],
      ),
    );

    final _videosSection = Container(
      padding: EdgeInsets.only(top: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "My videos",
            style: AppTextStyles.subHeaderTextStyle,
          ),
          SizedBox(height: 10.0),
          Container(
            height: screenWidth * 0.32,
            child: ListView.builder(
              itemCount: _videos.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                var video = _videos[index];
                return VideoCard(
                  video: video,
                );
              },
            ),
          )
        ],
      ),
    );

    return Scaffold(
      appBar: _appBar,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Container(
            padding: EdgeInsets.only(top: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _headerText,
                _descriptionText,
                _categorySection,
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

  Widget _buildCategoryCard(
    int index,
    Color color,
    String top,
    String bottom,
    BuildContext context,
  ) {
    return CategoryCard(
      index: index,
      selectedCardIndex: selectedCardIndex,
      color: color,
      top: top,
      bottom: bottom,
      onPressed: () => selectCategory(index),
    );
  }

  TextStyle switchColor(index) {
    return selectedTabIndex == index
        ? AppTextStyles.selectedTabTextStyle
        : AppTextStyles.unselectedTabTextStyle;
  }

  void selectCategory(int index) {
    setState(() {
      selectedCardIndex = index;
    });
  }
}
