import 'dart:developer';

import '../../services/service_index.dart';
import 'package:rxdart/rxdart.dart';

class ReviewProvider {
  final BehaviorSubject<List<ReviewServerResponse>> _reviewsStream =
      BehaviorSubject<List<ReviewServerResponse>>.seeded([]);
  requestGetReviews(String forItem) async {
    final reviewsFromServer =
        await AppServices.reviewServerProviable.getReviews(forItemID: forItem);
    _reviewsStream.add(reviewsFromServer);
  }

  BehaviorSubject<List<ReviewServerResponse>> observerReviews() {
    return _reviewsStream;
  }
}
