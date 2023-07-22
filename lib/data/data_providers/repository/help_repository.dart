import 'package:magdsoft_flutter_structure/data/models/help_model.dart';
import 'package:magdsoft_flutter_structure/data/network/responses/help_web_services.dart';

class HelpRepository {
  final HelpWebServices _helpWebServices;

  HelpRepository(this._helpWebServices);

  Future<List<HelpModel>> getAllHelp() async {
    final help = await _helpWebServices.getAllHelp();
    return help.map((help) => HelpModel.fromJson(help)).toList();
  }
}
