import 'package:equatable/equatable.dart';

abstract class WishlistEvent {}

class AddNewItem extends WishlistEvent {
  final String description;
  AddNewItem(this.description);
}

class FetchWishlist extends WishlistEvent {}
