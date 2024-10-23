import 'dart:developer';
import 'package:event/services/local_notification_service.dart';
import 'package:flutter/material.dart';

class NotificationViewModel extends ChangeNotifier {
  bool _isNotificationOn = false;

  bool get isNotificationOn => _isNotificationOn;

  void toggleNotification(DateTime eventDate) {
    _isNotificationOn = !_isNotificationOn; // Toggle the notification state

    // Debug log to verify the state
    log('Notification state changed: $_isNotificationOn'); // Use log from dart:developer

    if (_isNotificationOn) {
      // Schedule notification if it's being turned on
      LocalNotificationService.showScheduledNotification(eventDate);
      log('Notification scheduled for: $eventDate'); // Use log from dart:developer
    } else {
      // Cancel the notification
      LocalNotificationService.flutterLocalNotificationsPlugin.cancel(2);
      log('Notification canceled'); // Use log from dart:developer
    }

    notifyListeners(); // Notify listeners about the change
  }
}