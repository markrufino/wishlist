import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wishlist/bloc/wishlist/wishlist_event.dart';
import 'package:wishlist/bloc/wishlist/wishlist_state.dart';
import 'package:wishlist/services/wishlist_repository.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  final WishlistRepository repo;

  WishlistBloc(this.repo) : super(WishlistInitialState()) {
    on<FetchWishlist>((event, emit) async {
      emit(WishlistLoading());
      final wishes = await repo.loadWishlist();
      emit(WishlistLoaded(wishes));
    });
    on<AddNewItem>((event, emit) async {
      emit(WishlistLoading());
      await repo.addToWishlist(event.description);
      emit(WishlistItemAdded());
      add(FetchWishlist());
    });
  }
}
