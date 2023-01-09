import 'package:rxdart/rxdart.dart';
import "dart:math";
import '../../../presentionals_index.dart';

class NotificationScreenBloc {
  final BehaviorSubject<List<NotificationUIModel>> _notificationsSubject =
      BehaviorSubject<List<NotificationUIModel>>.seeded([]);
  NotificationScreenBloc() {
    // you can enable the stress test, it will flood notification with 10000 items
    _createSampleForTestingOnly(isStressTest: false);
  }
  observerNotification() {
    return _notificationsSubject;
  }

  dispose() {
    _notificationsSubject.close();
  }

  /// this is the sample data for notification,
  /// In the real app, you should change this to api call or take data from provider
  /// After that, using the map/ transform to switch to this
  _createSampleForTestingOnly({required bool isStressTest}) {
    final randomTittle = [
      '30% Special discount',
      '20% Free discount',
      'Free Ship'
    ];
    final randomDescription = [
      'Special gift for you',
      'From our admin',
      'From your friend'
    ];
    final randomDate = ['11/11/2022', '12/11/2022', '13/11/2022'];
    final numberOfNotification = isStressTest ? 10000 : 30;
    final sampleData = List.generate(
      numberOfNotification,
      (index) => NotificationUIModel(
          dateAsString: randomDate[Random().nextInt(randomDate.length)],
          tittle: randomTittle[Random().nextInt(randomTittle.length)],
          description:
              randomDescription[Random().nextInt(randomDescription.length)],
          type: NotificationUIModelType.card),
    ).toList();
    _notificationsSubject.add(sampleData);
  }
}
