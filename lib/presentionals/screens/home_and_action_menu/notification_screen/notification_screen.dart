import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import '../../../presentionals_index.dart';
import '../../../widgets/app_item_style_configuration.dart';
import 'notification_screen_bloc.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final NotificationScreenBloc _notificationScreenBloc =
      NotificationScreenBloc();
  @override
  void dispose() {
    super.dispose();
    _notificationScreenBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).canvasColor,
      child: SafeArea(
        child: Column(
          children: [
            const AppNavigationBar(
              tittle: 'Notification',
            ),
            Expanded(
              child: AppHorizontalPaddingChild(
                child: StreamBuilder<List<NotificationUIModel>>(
                    stream: _notificationScreenBloc.observerNotification(),
                    builder: (context, snapshot) {
                      List<NotificationUIModel> notifications =
                          snapshot.data ?? [];
                      return GroupedListView<NotificationUIModel, String>(
                        elements: notifications,
                        groupBy: (element) => element.dateAsString,
                        groupComparator: (value1, value2) =>
                            value2.compareTo(value1),
                        itemComparator: (item1, item2) =>
                            item1.dateAsString.compareTo(item2.dateAsString),
                        order: GroupedListOrder.ASC,
                        groupSeparatorBuilder: (String value) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            value,
                            textAlign: TextAlign.start,
                            style:
                                Theme.of(context).textTheme.headline6!.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                        ),
                        itemBuilder: (c, element) {
                          return Padding(
                            padding: EdgeInsets.only(
                              bottom: AppStyleConfiguration.paddingSpacer,
                            ),
                            child: Column(
                              children: [
                                AppNotificationItem(
                                  notificationUIModel: element,
                                ),
                                const AppVerticalPadding(),
                              ],
                            ),
                          );
                        },
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
