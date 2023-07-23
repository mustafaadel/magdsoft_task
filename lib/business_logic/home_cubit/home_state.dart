part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class CardSelected extends HomeState {
  final int selectedIndex;

  CardSelected({required this.selectedIndex});
}

class ProductLoaded extends HomeState {
  final List<Products> product;

  ProductLoaded(this.product);
}
