import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);
//Kısa yol
  void increment() => emit(state +1);
  void decrement() => emit(state -1);


  /* Uzun yol
  void increment(){
    
    //İçinde bir değer var. new value olarak atadık.
    final newValue = state + 1;
    emit(newValue); 

  }  */
  /* void decrement(){
  emit(state-1);
  } */


}


