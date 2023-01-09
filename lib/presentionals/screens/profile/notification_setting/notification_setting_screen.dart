import 'package:flutter/material.dart';
import 'package:flutter_shop_ui_template_for_sale/presentionals/presentionals_index.dart';

import 'notification_setting_screen_bloc.dart';

class NotificationSettingScreen extends StatefulWidget {
  const NotificationSettingScreen({super.key});

  @override
  State<NotificationSettingScreen> createState() =>
      _NotificationSettingScreenState();
}

class _NotificationSettingScreenState extends State<NotificationSettingScreen> {
  final NotificationSettingBloc _notificationSettingBloc =
      NotificationSettingBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const AppNavigationBar(tittle: 'Notification Setting'),
            Expanded(
              child: SingleChildScrollView(
                child: StreamBuilder<List<NotificationSettingModel>>(
                  stream: _notificationSettingBloc.observerSetting(),
                  builder: (context, snapshot) {
                    final List<NotificationSettingModel> settings =
                        snapshot.data ?? [];
                    return Column(
                      children: settings
                          .map(
                            (e) => Column(
                              children: [
                                AppSettingSwitchTile(
                                  tittle: e.tittleOfSetting,
                                  isEnableStream: e.isActived,
                                  onSwitched: (bool value) => e.update(value),
                                ),
                                const AppVerticalPadding(),
                              ],
                            ),
                          )
                          .toList(),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
