// ignore_for_file: avoid_print

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shoping_cart/data/cart_items.dart';
import 'package:shoping_cart/data/grocery_data.dart';
import 'package:shoping_cart/data/whishlist_item.dart';
import 'package:shoping_cart/features/home/model/home_product_data_model.dart';

part 'home_bloc_event.dart';
part 'home_bloc_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeEventWhishlistButtonClickedEvent>(
        homeEventWhishlistButtonClickedEvent);
    on<HomeEventCartButtonClickedEvent>(homeEventCartButtonClickedEvent);
    on<HomeWhishlistNavigateEvent>(homeWhishlistNavigateEvent);
    on<HomeCartNavigateEvent>(homeCartNavigateEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(Duration(seconds: 3));
    emit(HomeLoadedSuccessState(
        products: GroceryData.groceryProducts
            .map((e) => ProductDataModel(
                id: e['id'],
                name: e['name'],
                description: e['description'],
                price: e['price'],
                imageURL: e['imageURL']))
            .toList()));
  }

  FutureOr<void> homeEventWhishlistButtonClickedEvent(
      HomeEventWhishlistButtonClickedEvent event, Emitter<HomeState> emit) {
    print('whishlist item clicked');
    whishlistItems.add(event.clickedProduct);
    emit(HomeProductItemWhishlistPageActionState());
  }

  FutureOr<void> homeEventCartButtonClickedEvent(
      HomeEventCartButtonClickedEvent event, Emitter<HomeState> emit) {
    print('cart item clicked');
    cartItems.add(event.clickedProduct);
    emit(HomeProductItemCartPageActionState());
  }

  FutureOr<void> homeWhishlistNavigateEvent(
      HomeWhishlistNavigateEvent event, Emitter<HomeState> emit) {
    print('Whilist navigate clicked');
    emit(HomeNavigationToWishlistPageActionState());
  }

  FutureOr<void> homeCartNavigateEvent(
      HomeCartNavigateEvent event, Emitter<HomeState> emit) {
    print('cart navigate clicked');
    emit(HomeNavigationToCartPageActionState());
  }
}
