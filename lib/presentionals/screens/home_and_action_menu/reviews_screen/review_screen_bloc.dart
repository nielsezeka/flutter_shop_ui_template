import 'package:flutter_shop_ui_template_for_sale/bloc/global_bloc.dart';
import 'package:rxdart/rxdart.dart';
import '../../../presentionals_index.dart';

class ReviewScreenBloc {
  Stream<String> observerReview() {
    return Rx.combineLatest2(
      GlobalBloc.reviewProvider.observerReviews(),
      GlobalBloc.productDataBloc.observerFocusingProduct(),
      (List<ReviewServerResponse> a, ProductModeFromBackend? b) {
        return ' ${b?.averageRate} (${a.length} Reviews)';
      },
    );
  }

  Stream<List<AppUserReviewItemUIModel>> observerReviews() {
    return GlobalBloc.reviewProvider.observerReviews().switchMap(
      (listItem) {
        final listReview = listItem
            .map(
              (element) => AppUserReviewItemUIModel.from(
                element,
              ),
            )
            .toList();
        listReview.sort(((a, b) => b.reviewDate.compareTo(a.reviewDate)));
        return Stream.value(listReview);
      },
    );
  }
}
