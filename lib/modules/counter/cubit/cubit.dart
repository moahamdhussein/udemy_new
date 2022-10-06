import 'package:udemy_new/modules/counter/cubit/states.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterStates> {
  CounterCubit() : super(CounterInitialStates());

  static CounterCubit get(context) => BlocProvider.of(context);
  int counter = 0;

  void minus() {
    counter--;
    emit(CounterMinusStates(counter));
  }

  void plus() {
    counter++;
    emit(CounterPlusStates(counter));
  }
}
