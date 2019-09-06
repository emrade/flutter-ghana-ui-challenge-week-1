import 'package:flutter/material.dart';
import '../../../models/notification.dart';
import '../../../utils/colors.dart';
import '../../../widgets/notification_card.dart';
class SecondSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    final _ssbr = Radius.circular(45.0);
    
    return Container(
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
  }
}