import '../../../constants/end_points.dart';
import '../../data_providers/remote/dio_helper.dart';

class ProductsWebservices {
  Future<List<dynamic>> getAllProducts() async {
    try {
      final response = await DioHelper.getData(endPoint: EndPoint.products);
      return response.data['products'];
    } catch (e) {
      return [];
    }
  }
}
