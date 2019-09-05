import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/notification.dart';
import '../widgets/notification_card.dart';
import '../utils/colors.dart';
import '../utils/utils.dart';

import '../router.dart';

class NotificationsPage extends StatefulWidget {
  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage>
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
    final screenHeight = MediaQuery.of(context).size.height;

    final _userImage = GestureDetector(
      onTap: () => Navigator.pushNamed(context, homeViewRoute),
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
          onTap: () => Navigator.pushNamed(context, homeViewRoute),
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            "Notifications",
            style: AppTextStyles.headerTextStyle,
          ),
          SizedBox(
            width: 10.0,
          ),
          Container(
            height: 30.0,
            width: 30.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: CustomColors.primaryColor.withOpacity(0.3),
            ),
            child: Center(
              child: Text(
                "12",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          )
        ],
      ),
    );

    final _searchBar = Container(
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

    final _tabSection = Container(
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

    final _firstSection = Container(
      height: screenHeight * 0.35,
      padding: EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[_headerText, _searchBar, _tabSection],
      ),
    );

    final _ssbr = Radius.circular(45.0);

    final _secondSection = Container(
      height: screenHeight * 0.55,
      padding: EdgeInsets.only(left: 20.0, right: 20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: _ssbr, topRight: _ssbr),
        color: CustomColors.notificationSectionColor,
      ),
      child: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 10.0),
        itemCount: notifications.length,
        itemBuilder: (BuildContext context, int index) {
          AppNotification notification = notifications[index];
          return NotificationCard(notification: notification);
        },
      ),
    );

    return Scaffold(
      appBar: _appBar,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[_firstSection, _secondSection],
          ),
        ),
      ),
    );
  }
}
