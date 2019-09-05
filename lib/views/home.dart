import 'package:flutter/material.dart';
import 'package:flutter_ghana_ui_challenge_week_1/widgets/category_card.dart';
import '../utils/colors.dart';
import '../utils/utils.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedCardIndex = 0;

  @override
  Widget build(BuildContext context) {
    final _appBar = AppBar();

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
                _categorySection
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
      onPressed: () {
        selectCategory(index);
      },
    );
  }

  void selectCategory(int index) {
    setState(() {
      selectedCardIndex = index;
    });
  }
}
