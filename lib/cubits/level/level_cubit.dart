import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'level_state.dart';

class LevelCubit extends Cubit<LevelState> {
  LevelCubit() : super(LevelInitial());
}
