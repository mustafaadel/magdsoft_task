import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/data_providers/repository/product_repository.dart';
import '../../data/models/product_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final ProductRepository _productRepository;
  List<Products> _product = [];
  HomeCubit(this._productRepository) : super(HomeInitial());
  List<Products> product() {
    _productRepository.getAllProducts().then((product) {
      emit(ProductLoaded(product));
      _product = product;
    });

    return _product;
  }

  selectCard(int index) {
    emit(CardSelected(selectedIndex: index));
  }
}
