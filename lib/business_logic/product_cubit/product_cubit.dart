import 'package:bloc/bloc.dart';
import 'package:magdsoft_flutter_structure/data/models/product_model.dart';
import 'package:meta/meta.dart';

import '../../data/data_providers/repository/product_repository.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepository _productRepository;
  List<Products> _product = [];
  ProductCubit(this._productRepository) : super(ProductInitial());

  List<Products> product() {
    _productRepository.getAllProducts().then((product) {
      emit(ProductLoaded(product));
      _product = product;
    });

    return _product;
  }
}
