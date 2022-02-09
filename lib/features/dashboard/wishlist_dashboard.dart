import 'package:flutter/material.dart';
import 'package:wishlist/constants.dart';
import 'package:wishlist/services/wishlist_repository.dart';

class WishlistDashboard extends StatelessWidget {
  final WishlistRepositoryInterface repo;
  const WishlistDashboard({Key? key, required this.repo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(kAppTitle),
      ),
    );
  }
}
