import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shoping_cart/data/cart_items.dart';
import 'package:shoping_cart/data/whishlist_item.dart';
import 'package:shoping_cart/features/home/model/home_product_data_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<CartRemoveFromCartEvent>(cartRemoveFromCartEvent);
    on<CartItemAddToWhilistEvent>(cartItemAddToWhilistEvent);
  }

  FutureOr<void> cartInitialEvent(
      CartInitialEvent event, Emitter<CartState> emit) {
    emit(CartSuccessState(cartItems: cartItems));
  }

  FutureOr<void> cartRemoveFromCartEvent(
      CartRemoveFromCartEvent event, Emitter<CartState> emit) {
    cartItems.remove(event.clickedProduct);
    emit(CartProductItemRemoveState());
    emit(CartSuccessState(cartItems: cartItems));
  }

  FutureOr<void> cartItemAddToWhilistEvent(
      CartItemAddToWhilistEvent event, Emitter<CartState> emit) {
    whishlistItems.add(event.clickedProduct);
    emit(CartProductItemAddToWhishList());
    // emit(CartWhishListItemAddedState(isWhishListed: true));
  }
}
