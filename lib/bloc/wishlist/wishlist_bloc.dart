import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wishlist/bloc/wishlist/wishlist_event.dart';
import 'package:wishlist/bloc/wishlist/wishlist_state.dart';
import 'package:wishlist/models/wish_model.dart';
import 'package:wishlist/services/wishlist_repository.dart';

class WishlistBloc extends Bloc<WishlistEvents, WishlistState> {
  final WishlistRepository repo;
  List<WishModel> wishes;

  WishlistBloc(this.repo, this.wishes) : super(WishlistInitialState());

  @override
  Stream<WishlistState> mapEventToState(WishlistEvents event) async* {
    switch (event) {
      case WishlistEvents.fetchWishlist:
        yield WishlistLoading();
        wishes = await repo.loadWishlist();
        yield WishlistLoaded(wishes);
        break;
    }
  }
}
