import 'package:cloud_firestore/cloud_firestore.dart';

class WishlistItemModel {
  final String details;
  final bool checked;

  WishlistItemModel(this.details, this.checked);

  static WishlistItemModel fromMap(Map<String, dynamic> map) {
    return WishlistItemModel(
      map['description'],
      map['isChecked'],
    );
  }
}
