import 'package:magdsoft_flutter_structure/constants/end_points.dart';
import 'package:magdsoft_flutter_structure/data/data_providers/remote/dio_helper.dart';

class HelpWebServices {
  Future<List<dynamic>> getAllHelp() async {
    try {
      final response = await DioHelper.getData(endPoint: EndPoint.help);
      return response.data['help'];
    } catch (e) {
      return [];
    }
  }
}
