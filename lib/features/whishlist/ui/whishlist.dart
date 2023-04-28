// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoping_cart/features/whishlist/bloc/whish_list_bloc.dart';
import 'package:shoping_cart/features/whishlist/ui/whishlist_tile_widget.dart';

class WhishList extends StatefulWidget {
  const WhishList({super.key});

  @override
  State<WhishList> createState() => _WhishListState();
}

class _WhishListState extends State<WhishList> {
  final WhishListBloc whishListBloc = WhishListBloc();
  @override
  void initState() {
    whishListBloc.add(WhilistInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('WhishList Items'),
      ),
      body: BlocConsumer<WhishListBloc, WhishListState>(
        bloc: whishListBloc,
        listenWhen: (previous, current) => current is WhishListActionState,
        buildWhen: (previous, current) => current is! WhishListActionState,
        listener: (context, state) {
          // item remove from whilist
          if (state is WhishListProductItemRemoveState) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Item Removed From WhishList')));
          }
          //  item add to cart
          else if (state is WhishListProductItemAddToCartState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Item Added To Cart')));
          }
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case WhishListSuccessStates:
              final successState = state as WhishListSuccessStates;
              if (successState.whishListItems.isEmpty) {
                return Center(
                  child: Text(
                    'WhishList Items I Empty',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                );
              }
              return ListView.builder(
                itemCount: successState.whishListItems.length,
                itemBuilder: (context, index) {
                  return WhistlistTileWidget(
                      whishListBloc: whishListBloc,
                      productDataModel: successState.whishListItems[index]);
                },
              );

            default:
              return SizedBox();
          }
        },
      ),
    );
  }
}
