// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

//initial calling event
class CartInitialEvent extends CartEvent {}

// to remove item
class CartRemoveFromCartEvent extends CartEvent {
  final ProductDataModel clickedProduct;
  CartRemoveFromCartEvent({
    required this.clickedProduct,
  });
}

// Add item to whishlist from cart
class CartItemAddToWhilistEvent extends CartEvent {
  final ProductDataModel clickedProduct;
  CartItemAddToWhilistEvent({
    required this.clickedProduct,
  });
}
