import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wishlist/bloc/wishlist/wishlist_event.dart';
import 'package:wishlist/bloc/wishlist/wishlist_state.dart';
import 'package:wishlist/models/wishlist_item_model.dart';
import 'package:wishlist/services/wishlist_repository.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  final WishlistRepository repo;
  String newItemDescription = "";

  WishlistBloc(this.repo) : super(WishlistInitialState()) {
    on<WishlistDescriptionInput>((event, emit) async {
      newItemDescription = event.description;
    });
    on<FetchWishlist>((event, emit) async {
      emit(WishlistLoading());
      final wishes = await repo.loadWishlist();
      print(wishes.length);
      emit(WishlistLoaded(wishes));
    });
    on<AddNewItem>((event, emit) async {
      emit(WishlistLoading());
      await repo.addToWishlist(newItemDescription);
      emit(WishlistItemAdded());
      add(FetchWishlist());
    });
  }
}
