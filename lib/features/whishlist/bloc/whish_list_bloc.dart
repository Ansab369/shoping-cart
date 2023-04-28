import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shoping_cart/data/cart_items.dart';
import 'package:shoping_cart/data/whishlist_item.dart';
import 'package:shoping_cart/features/home/model/home_product_data_model.dart';

part 'whish_list_event.dart';
part 'whish_list_state.dart';

class WhishListBloc extends Bloc<WhishListEvent, WhishListState> {
  WhishListBloc() : super(WhishListInitial()) {
    on<WhilistInitialEvent>(whilistInitialEvent);
    on<RemoveItemFromWhilistEvent>(removeItemFromWhilistEvent);
    on<AddItemToCartWhilistEvent>(addItemToCartWhilistEvent);
  }

  FutureOr<void> whilistInitialEvent(
      WhilistInitialEvent event, Emitter<WhishListState> emit) {
    emit(WhishListSuccessStates(whishListItems: whishlistItems));
  }

  FutureOr<void> removeItemFromWhilistEvent(
      RemoveItemFromWhilistEvent event, Emitter<WhishListState> emit) {
    // remove from llist
    whishlistItems.remove(event.clickedProduct);
    // emit success State
    emit(WhishListSuccessStates(whishListItems: whishlistItems));
    // sent scaffold message
    emit(WhishListProductItemRemoveState());
  }

  FutureOr<void> addItemToCartWhilistEvent(
      AddItemToCartWhilistEvent event, Emitter<WhishListState> emit) {
    // add to cart
    cartItems.add(event.clickedProduct);
    //sent scaffold message
    emit(WhishListProductItemAddToCartState());
  }
}
