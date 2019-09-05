import '../utils/utils.dart';

class AppNotification {
  String image, notification, time = '2 hours ago';
  bool isRead;

  AppNotification(this.image, this.notification, this.isRead);
}

List<AppNotification> notifications = [
  AppNotification(AvailableImages.bleach, 'Kurosaki Ichigo commented on your post: "Bankai! 🔪" ', false),
  AppNotification(AvailableImages.naruto, 'Uzumaki Naruto commented on your post: "Nakama 👊"', true),
  AppNotification(AvailableImages.natsu, 'Natsu Dragonnel commented on your post: "Zeref 👿"', false),
  AppNotification(AvailableImages.luffy, 'Monkey D. Luffy commented on your post: "Gear 5th 😁"', true),
];