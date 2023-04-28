// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc_bloc.dart';

@immutable
abstract class HomeEvent {}

//! initial
class HomeInitialEvent extends HomeEvent {}

//! product button
class HomeEventWhishlistButtonClickedEvent extends HomeEvent {
  final ProductDataModel clickedProduct;
  HomeEventWhishlistButtonClickedEvent({
    required this.clickedProduct,
  });
}

class HomeEventCartButtonClickedEvent extends HomeEvent {
  final ProductDataModel clickedProduct;
  HomeEventCartButtonClickedEvent({
    required this.clickedProduct,
  });
}

//! navigation
class HomeWhishlistNavigateEvent extends HomeEvent {}

class HomeCartNavigateEvent extends HomeEvent {}
