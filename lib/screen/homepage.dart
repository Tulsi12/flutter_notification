import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int counter = 1;
  _checkNotificationEnabled() {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
  }

  @override
  void initState() {
    _checkNotificationEnabled();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    AwesomeNotifications().createNotification(
                        content: NotificationContent(
                            id: counter,
                            channelKey: 'basic_channel',
                            title: 'Notification title',
                            body: "This is body"));
                    setState(() {
                      counter++;
                    });
                  },
                  child: const Text('Button'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
