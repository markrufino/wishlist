import 'package:flutter/material.dart';
import 'package:wishlist/models/wishlist_item_model.dart';

class WishlistListTile extends StatelessWidget {
  final WishlistItemModel item;

  const WishlistListTile({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item.details),
    );
  }
}
