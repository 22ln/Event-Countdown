import 'dart:developer';
import 'package:event/services/local_notification_service.dart';
import 'package:flutter/material.dart';

class NotificationViewModel extends ChangeNotifier {
  // Store notification state for each event by their ID
  final Map<int, bool> _notificationStates = {};

  bool isNotificationOn(int eventId) => _notificationStates[eventId] ?? false;

  void toggleNotification(int eventId, DateTime eventDate) {
    // Toggle the notification state for the specific event ID
    _notificationStates[eventId] = !isNotificationOn(eventId);

    // Debug log to verify the state
    log('Notification state changed for event $eventId: ${_notificationStates[eventId]}');

    if (_notificationStates[eventId]!) {
      // Schedule notification if it's being turned on
      LocalNotificationService.showScheduledNotification(eventDate);
      log('Notification scheduled for event $eventId: $eventDate');
    } else {
      // Cancel the notification
      LocalNotificationService.flutterLocalNotificationsPlugin.cancel(eventId);
      log('Notification canceled for event $eventId');
    }

    notifyListeners(); // Notify listeners about the change
  }
}
