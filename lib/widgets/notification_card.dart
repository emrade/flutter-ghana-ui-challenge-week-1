import 'package:flutter/material.dart';
import '../models/notification.dart';

class NotificationCard extends StatelessWidget {
  final AppNotification notification;

  const NotificationCard({Key key, @required this.notification})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final isUnread = Positioned(
      top: 0.0,
      right: 6.0,
      child: Container(
        height: 12.0,
        width: 12.0,
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.red),
      ),
    );

    final _userImage = Container(
      margin: EdgeInsets.only(right: 20.0),
      child: Stack(
        children: <Widget>[
          Container(
            width: 80.0,
          ),
          Container(
            margin: EdgeInsets.only(top: 3.0),
            height: 70.0,
            width: 70.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(notification.image),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
          notification.isRead ? Container() : isUnread
        ],
      ),
    );

    final _notificationAndTime = Container(
      child: Flexible(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              notification.notification,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 16.0
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              notification.time,
              style: TextStyle(
                color: Colors.grey.withOpacity(0.6),
                fontWeight: FontWeight.w600,
                fontSize: 16.0
              ),
            ),
          ],
        ),
      ),
    );

    return Container(
      margin: EdgeInsets.only(bottom: 28.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[_userImage, _notificationAndTime],
      ),
    );
  }
}
