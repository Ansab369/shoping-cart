// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:shoping_cart/features/home/model/home_product_data_model.dart';
import 'package:shoping_cart/features/whishlist/bloc/whish_list_bloc.dart';

class WhistlistTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final WhishListBloc whishListBloc;
  const WhistlistTileWidget({
    Key? key,
    required this.productDataModel,
    required this.whishListBloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 15,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: Image.network(
                productDataModel.imageURL,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              productDataModel.name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              '\$${productDataModel.price}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.green,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              productDataModel.description,
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {
                  whishListBloc.add(RemoveItemFromWhilistEvent(
                      clickedProduct: productDataModel));
                },
                icon: Icon(
                  Icons.favorite,
                  color: Colors.teal,
                ),
              ),
              IconButton(
                onPressed: () {
                  whishListBloc.add(AddItemToCartWhilistEvent(
                      clickedProduct: productDataModel));
                },
                icon: Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.teal,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
