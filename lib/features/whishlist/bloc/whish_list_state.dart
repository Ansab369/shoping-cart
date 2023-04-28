part of 'whish_list_bloc.dart';

@immutable
abstract class WhishListState {}

abstract class WhishListActionState extends WhishListState {}

class WhishListInitial extends WhishListState {}

class WhishListSuccessStates extends WhishListState {
  final List<ProductDataModel> whishListItems;
  WhishListSuccessStates({
    required this.whishListItems,
  });
}

//! actions state -- scaffold messanger

// remove from whishlist
class WhishListProductItemRemoveState extends WhishListActionState {}

// add to cart
class WhishListProductItemAddToCartState extends WhishListActionState {}
