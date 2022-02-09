import 'package:equatable/equatable.dart';
import 'package:wishlist/models/wishlist_item_model.dart';

abstract class WishlistState extends Equatable {
  @override
  List<Object> get props => [];
}

class WishlistInitialState extends WishlistState {}

class WishlistLoading extends WishlistState {}

class WishlistLoaded extends WishlistState {
  final List<WishlistItemModel> items;
  WishlistLoaded(this.items);
}

class WishlistItemAdded extends WishlistState {}

class WishlistError extends WishlistState {}
