import 'package:flutter/material.dart';
import 'package:wishlist/bloc/wishlist/wishlist_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wishlist/bloc/wishlist/wishlist_event.dart';

class AddWishAlert extends StatelessWidget {
  const AddWishAlert({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add New Item'),
      content: TextField(
        decoration: const InputDecoration(hintText: 'Enter your new wish!'),
        onChanged: (value) {
          context.read<WishlistBloc>().add(WishlistDescriptionInput(value));
        },
      ),
      actions: [
        TextButton(
          onPressed: () {
            context.read<WishlistBloc>().add(AddNewItem());
            Navigator.pop(context);
          },
          child: Text('SUBMIT'),
        ),
      ],
    );
  }
}
