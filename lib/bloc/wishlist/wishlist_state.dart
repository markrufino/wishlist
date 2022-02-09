import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:wishlist/models/wish_model.dart';

abstract class WishlistState extends Equatable {
  @override
  List<Object> get props => [];
}

class WishlistInitialState extends WishlistState {}

class WishlistLoading extends WishlistState {}

class WishlistLoaded extends WishlistState {
  final List<WishModel> wishes;
  WishlistLoaded(this.wishes);
}

class WishlistAddingItem extends WishlistState {
  final WishModel wish;
  WishlistAddingItem(this.wish);
}

class WishlistItemAdded extends WishlistState {
  final WishModel wish;
  WishlistItemAdded(this.wish);
}

class WishlistError extends WishlistState {}
