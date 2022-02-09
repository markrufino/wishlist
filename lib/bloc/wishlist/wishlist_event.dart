import 'package:equatable/equatable.dart';

abstract class WishlistEvent {}

class WishlistDescriptionInput extends WishlistEvent {
  final String description;
  WishlistDescriptionInput(this.description);
}

class AddNewItem extends WishlistEvent {}

class FetchWishlist extends WishlistEvent {}
