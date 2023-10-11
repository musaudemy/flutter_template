part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent() : super();

  @override
  List<Object> get props => [];
}

class HomeInit extends HomeEvent {
  const HomeInit() : super();
}
