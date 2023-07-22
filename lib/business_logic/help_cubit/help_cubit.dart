import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/data/data_providers/repository/help_repository.dart';
import 'package:meta/meta.dart';

import '../../data/models/help_model.dart';

part 'help_state.dart';

class HelpCubit extends Cubit<HelpState> {
  final HelpRepository _helpRepository;
  List<HelpModel> _help = [];
  HelpCubit(this._helpRepository) : super(HelpInitial());

  List<HelpModel> help() {
    _helpRepository.getAllHelp().then((help) {
      emit(HelpLoaded(help));
      _help = help;
    });

    return _help;
  }
}
