import 'dart:isolate';
import 'dart:ui';

import 'package:capstone_project_jti/data/api/destination_api_service.dart';
import 'package:capstone_project_jti/helpers/notification_helper.dart';
import 'package:capstone_project_jti/main.dart';

final ReceivePort port = ReceivePort();

class BackgroundService {
  static BackgroundService _instance;
  static const String _isolateName = 'isolate';
  static SendPort _uiSendPort;

  BackgroundService._internal() {
    _instance = this;
  }

  factory BackgroundService() => _instance ?? BackgroundService._internal();

  void initializeIsolate() {
    IsolateNameServer.registerPortWithName(port.sendPort, _isolateName);
  }

  static Future<void> callback() async {
    print('Alarm Fired!');
    final NotificationHelper _notificationHelper = NotificationHelper();
    var destinations = await DestinationApiService().getAllDestinationApi();
    await _notificationHelper.showNotification(
        flutterLocalNotificationsPlugin, destinations);

    _uiSendPort ??= IsolateNameServer.lookupPortByName(_isolateName);
    _uiSendPort?.send(null);
  }
}
