part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  final dynamic folders;
  const HomeState(this.folders) : super();

  @override
  List<Object> get props => [folders];
}

class HomeLoading extends HomeState {
  const HomeLoading() : super(const []);
}

class HomeSuccess extends HomeState {
  const HomeSuccess() : super(const []);
}

class HomeError extends HomeState {
  const HomeError() : super(const []);
}

class HomeNoData extends HomeState {
  const HomeNoData() : super(const []);
}
