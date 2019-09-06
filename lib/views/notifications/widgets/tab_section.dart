import 'package:flutter/material.dart';
import '../../../utils/colors.dart';

class TabSection extends StatefulWidget {
  @override
  _TabSectionState createState() => _TabSectionState();
}

class _TabSectionState extends State<TabSection>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  final List<String> _tabs = ["TODAY", "LAST WEEK"];

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: _tabs.length);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30.0),
      child: TabBar(
        controller: tabController,
        unselectedLabelColor: Colors.grey.withOpacity(0.6),
        labelColor: CustomColors.notificationSectionColor,
        indicatorColor: Colors.white,
        isScrollable: true,
        tabs: _tabs.map((tab) {
          return Tab(
            child: Text(
              tab,
              style: TextStyle(
                fontWeight: FontWeight.w700,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
