import 'package:wishlist/models/wish_model.dart';

abstract class WishlistRepositoryInterface {
  Future<List<WishModel>> loadWishlist();
  Future<void> addToWishlist(WishModel item);
}

class WishlistRepository extends WishlistRepositoryInterface {
  Future<List<WishModel>> loadWishlist() {
    final List<WishModel> wishlist = [];
    return Future.delayed(const Duration(seconds: 12), () {
      return wishlist;
    });
  }

  Future<void> addToWishlist(WishModel item) {
    return Future.delayed(const Duration(seconds: 12), () {
      return;
    });
  }
}
