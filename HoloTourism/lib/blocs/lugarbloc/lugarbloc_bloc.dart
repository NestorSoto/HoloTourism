import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:untitled1/models/lugar_model.dart';

part 'lugarbloc_event.dart';
part 'lugarbloc_state.dart';

class LugarblocBloc extends Bloc<LugarblocEvent, LugarblocState> {
  LugarblocBloc() : super(LugarblocInitial()) {
    on<LugarblocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
