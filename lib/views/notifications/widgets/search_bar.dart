import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../utils/colors.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50.0),
      height: 50.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: CustomColors.unselectedCardColor,
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search for name",
          hintStyle: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.grey.withOpacity(0.6),
          ),
          border: InputBorder.none,
          prefixIcon: Icon(
            CupertinoIcons.search,
            color: Colors.black,
            size: 30.0,
          ),
        ),
      ),
    );
  }
}
