// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc_bloc.dart';

@immutable
abstract class HomeState {}

abstract class HomeActionState extends HomeState {}

//! normal state
class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedSuccessState extends HomeState {
  final List<ProductDataModel> products;
  HomeLoadedSuccessState({
    required this.products,
  });
}

class HomeErrorState extends HomeState {}

//! action state

class HomeNavigationToWishlistPageActionState extends HomeActionState {}

class HomeNavigationToCartPageActionState extends HomeActionState {}

//! on add to list to show scaffold messanger
class HomeProductItemWhishlistPageActionState extends HomeActionState {}

class HomeProductItemCartPageActionState extends HomeActionState {}
