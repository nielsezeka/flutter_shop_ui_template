import '../server_data_provider.dart';

class DummyReviewServerDataProvider implements ReviewServerProviable {
  // this is A dummy version of get reviews. in a real world application
  // please change it to your server
  @override
  Future<List<ReviewServerResponse>> getReviews({required String forItemID}) {
    // should call api right here....
    return Future.value([
      ReviewServerResponse(
        userName: 'user dummy 1',
        userImageUrl: 'https://i.pravatar.cc/300?t=1',
        userRating: 2,
        itemReviewed: '1234',
        totalLoved: 10,
        reviewedText: 'dummy statement of comments...',
        reviewDate: DateTime.now(),
      ),
      ReviewServerResponse(
        userName: 'user dummy 2',
        userImageUrl: 'https://i.pravatar.cc/300?t=2',
        userRating: 4,
        itemReviewed: '1234',
        totalLoved: 20,
        reviewedText:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
        reviewDate: DateTime.now().subtract(const Duration(hours: 28)),
      ),
      ReviewServerResponse(
        userName: 'user dummy 3',
        userImageUrl: 'https://i.pravatar.cc/300?t=1',
        userRating: 3,
        itemReviewed: '1234',
        totalLoved: 10,
        reviewedText:
            'Lorem ipsum dolor sit amet, consectetur adipiscing el .... some comment is randomize created',
        reviewDate: DateTime.now(),
      ),
    ]);
  }
}
