import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'true_false_state.dart';

class TrueFalseCubit extends Cubit<bool> {
  TrueFalseCubit() : super(true);

  fav(){
    emit(state != state);
    print(state);
    return state;
  }
}
