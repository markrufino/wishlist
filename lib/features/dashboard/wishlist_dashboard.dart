import 'package:flutter/material.dart';
import 'package:wishlist/bloc/login/login_bloc.dart';
import 'package:wishlist/bloc/login/login_event.dart';
import 'package:wishlist/bloc/login/login_state.dart';
import 'package:wishlist/bloc/wishlist/wishlist_bloc.dart';
import 'package:wishlist/bloc/wishlist/wishlist_event.dart';
import 'package:wishlist/bloc/wishlist/wishlist_state.dart';
import 'package:wishlist/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wishlist/features/add_wish/add_wish_widget.dart';
import 'package:wishlist/features/dashboard/wishlist_list_tile.dart';
import 'package:wishlist/services/wishlist_repository.dart';

class WishlistDashboard extends StatefulWidget {
  const WishlistDashboard({Key? key}) : super(key: key);

  @override
  State<WishlistDashboard> createState() => _WishlistDashboardState();
}

class _WishlistDashboardState extends State<WishlistDashboard> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<WishlistBloc>().add(FetchWishlist());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: BlocProvider.of<LoginBloc>(context),
      listener: (context, state) {
        if (state is LogoutSuccess) {
          Navigator.pop(context);
        }
      },
      child: _buildScaffold(context),
    );
  }

  Scaffold _buildScaffold(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(kAppTitle),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              context.read<LoginBloc>().add(LogoutTapped());
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: BlocBuilder<WishlistBloc, WishlistState>(
        builder: (context, state) {
          print(state.runtimeType);
          if (state is WishlistLoading) {
            print('adding new item');
          }
          if (state is WishlistLoaded) {
            return _buildListView(state);
          }
          return Container();
        },
      ),
      floatingActionButton: _buildFloatingActionButton(context),
    );
  }

  ListView _buildListView(WishlistLoaded state) {
    final items = state.items;
    return ListView.builder(
      itemCount: state.items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return WishlistListTile(item: item);
      },
    );
  }

  FloatingActionButton _buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () async {
        final description = await _showAddWishAlert(context);
        print(description);
        if (description != null) {
          context.read<WishlistBloc>().add(AddNewItem(description));
        }
      },
    );
  }

  Future<String?> _showAddWishAlert(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AddWishAlert();
      },
    );
  }
}
