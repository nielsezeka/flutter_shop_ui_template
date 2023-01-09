import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationSettingModel {
  final String tittleOfSetting;
  final String notificationKey;
  final bool defaultValue;
  final BehaviorSubject<bool> isActived = BehaviorSubject<bool>.seeded(false);

  NotificationSettingModel({
    required this.tittleOfSetting,
    required this.notificationKey,
    required this.defaultValue,
  }) {
    _readSyncValue();
  }

  update(bool value) async {
    isActived.add(value);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(tittleOfSetting, value);
  }

  _readSyncValue() async {
    final prefs = await SharedPreferences.getInstance();
    isActived.add(prefs.getBool(tittleOfSetting) ?? defaultValue);
  }
}

class NotificationSettingBloc {
  final BehaviorSubject<List<NotificationSettingModel>> _settings =
      BehaviorSubject<List<NotificationSettingModel>>.seeded([]);
  BehaviorSubject<List<NotificationSettingModel>> observerSetting() {
    return _settings;
  }

  NotificationSettingBloc() {
    _updateNotificationsSetting();
  }
  _updateNotificationsSetting() {
    _settings.add(
      [
        NotificationSettingModel(
            defaultValue: true,
            tittleOfSetting: 'General Notification',
            notificationKey: 'general'),
        NotificationSettingModel(
            defaultValue: false,
            tittleOfSetting: 'Sound',
            notificationKey: 'sound'),
        NotificationSettingModel(
            defaultValue: false,
            tittleOfSetting: 'Vibrate',
            notificationKey: 'vibrate'),
        NotificationSettingModel(
            defaultValue: false,
            tittleOfSetting: 'Special Offer',
            notificationKey: 'specialOffer'),
        NotificationSettingModel(
            defaultValue: false,
            tittleOfSetting: 'Promo & Discount',
            notificationKey: 'promoDiscount'),
      ],
    );
  }
}
