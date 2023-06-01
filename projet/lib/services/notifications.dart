// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:timezone/timezone.dart' as tz;

// class LocalNotificationService {
//   LocalNotificationService();

//   final _localNotificationService = FlutterLocalNotificationsPlugin();

//   Future<void> initialize() async {
//     const AndroidInitializationSettings androidInitializationSettings =
//         AndroidInitializationSettings('');

//     final InitializationSettings settings =
//         InitializationSettings(android: androidInitializationSettings);

//     await _localNotificationService.initialize(
//       settings,
//     );
//   }

//   Future<NotificationDetails> _notificationDetails() async {
//     const AndroidNotificationDetails androidNotificationDetails =
//         AndroidNotificationDetails(
//       'channel_id',
//       'channel_name',
//       channelDescription: 'description',
//       importance: Importance.max,
//       priority: Priority.max,
//       playSound: true,
//     );

//     return NotificationDetails(android: androidNotificationDetails);
//   }

//   Future<void> showScheduleNotification({
//     required int id,
//     required String title,
//     required String body,
//   }) async {
//     final details = await _notificationDetails();
//     final now = tz.TZDateTime.now(tz.local);

//     final scheduledDate =
//         tz.TZDateTime(tz.local, now.year, now.month, now.day, 22, 55);

//     await _localNotificationService.zonedSchedule(
//       id,
//       title,
//       body,
//       scheduledDate,
//       details,
//       androidAllowWhileIdle: true,
//       uiLocalNotificationDateInterpretation:
//           UILocalNotificationDateInterpretation.absoluteTime,
//     );
//   }
// }
