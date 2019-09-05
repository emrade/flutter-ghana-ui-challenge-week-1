import 'package:flutter/material.dart';
import 'views/notifications.dart';
import 'views/home.dart';

const String homeViewRoute = '/';
const String notificationsViewRoute = '/notifications';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case homeViewRoute:
      return MaterialPageRoute(builder: (_) => HomePage());
    case notificationsViewRoute:
      return MaterialPageRoute(builder: (_) => NotificationsPage());

      break;
    default:
      return MaterialPageRoute(builder: (_) => HomePage());
  }
}
