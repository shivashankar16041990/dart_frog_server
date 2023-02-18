import 'package:broadcast_bloc/broadcast_bloc.dart';
import 'package:dart_frog/dart_frog.dart';
class Counter_cubit extends BroadcastCubit<int>{
  Counter_cubit(super.initialState);
  void incerement()=>emit(state+1);
  void decreament ()=>emit(state-1);
}
final _counter=Counter_cubit(0);
final counterProvider=provider<Counter_cubit>((_)=>_counter);







