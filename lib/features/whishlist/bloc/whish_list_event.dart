// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'whish_list_bloc.dart';

@immutable
abstract class WhishListEvent {}

//initial calling event
class WhilistInitialEvent extends WhishListEvent {}

// remove from whishlist
class RemoveItemFromWhilistEvent extends WhishListEvent {
  final ProductDataModel clickedProduct;
  RemoveItemFromWhilistEvent({
    required this.clickedProduct,
  });
}

// add to cart
class AddItemToCartWhilistEvent extends WhishListEvent {
  final ProductDataModel clickedProduct;
  AddItemToCartWhilistEvent({
    required this.clickedProduct,
  });
}
