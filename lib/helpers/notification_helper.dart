import 'dart:convert';
import 'dart:math';

import 'package:capstone_project_jti/common/navigation.dart';
import 'package:capstone_project_jti/data/model/destination.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';

final selectNotificationSubject = BehaviorSubject<String>();

class NotificationHelper {
  static NotificationHelper _instance;

  NotificationHelper._internal() {
    _instance = this;
  }

  factory NotificationHelper() => _instance ?? NotificationHelper._internal();

  Future<void> initNotifications(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    var initializationSettingsAndroid =
        const AndroidInitializationSettings('app_icon');

    var initializationSettinsIOS = const IOSInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettinsIOS,
    );

    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (String payload) async {
      if (payload != null) {
        print('Notification payload : $payload');
      }
      selectNotificationSubject.add(payload ?? 'Empty payload');
    });
  }

  Future<void> showNotification(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin,
      Destination destinations) async {
    var _channelId = '1';
    var _channelName = 'channel_01';
    var _channelDescription = 'jti channel';

    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      _channelId,
      _channelName,
      channelDescription: _channelDescription,
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
      styleInformation: const DefaultStyleInformation(true, true),
    );

    var iOSPlatformChannelSpesifics = const IOSNotificationDetails();

    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpesifics,
    );

    var titleNotification = '<b>Rekomendasi Destinasi Wisata</b>';
    var destinationRandom = Random().nextInt(destinations.destinations.length);
    var titleDestination = destinations.destinations[destinationRandom].name;

    await flutterLocalNotificationsPlugin.show(
      0,
      titleNotification,
      titleDestination,
      platformChannelSpecifics,
      payload: json.encode(destinations.toJson()),
    );
  }

  void configureSelectNotificationSubject(String routeName) {
    selectNotificationSubject.stream.listen((String payload) async {
      var data = Destination.fromJson(json.decode(payload));
      var destinationRandom = Random().nextInt(data.destinations.length);
      var destination = data.destinations[destinationRandom];
      Navigation.intentWithData(routeName, destination);
    });
  }
}
