import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wishlist/models/wishlist_item_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class WishlistRepositoryInterface {
  Future<List<WishlistItemModel>> loadWishlist();
  Future<void> addToWishlist(String description);
}

class WishlistRepository extends WishlistRepositoryInterface {
  @override
  Future<List<WishlistItemModel>> loadWishlist() async {
    var uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) {
      throw ('User is not logged in.');
    }
    List<WishlistItemModel> wishlist = [];
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('wishlist')
        .get()
        .then((snapshot) {
      snapshot.docs.forEach(
        (item) {
          final model = WishlistItemModel.fromMap(item.data());
          wishlist.add(model);
        },
      );
    });
    return wishlist;
  }

  @override
  Future<void> addToWishlist(String description) async {
    var uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) {
      throw ('User is not logged in.');
    }
    final data = {
      'description': description,
      'isChecked': false,
      'timestamp': FieldValue.serverTimestamp(),
    };
    FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('wishlist')
        .doc()
        .set(data);
  }
}
