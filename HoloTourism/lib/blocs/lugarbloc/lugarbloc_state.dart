part of 'lugarbloc_bloc.dart';

abstract class LugarblocState extends Equatable {
  const LugarblocState();
  
  @override
  List<Object> get props => [];
}

class LugarblocInitial extends LugarblocState {}

class LugarblocLoading extends LugarblocState {

}

class LugarblocLoaded extends LugarblocState {
  final LugarModel _lugarModel;

  LugarblocLoaded(this._lugarModel);

}