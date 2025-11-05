part of 'home_bloc.dart';

@immutable
sealed class HomeEvent extends Equatable {
  const HomeEvent();
}


class LoadJobListEvent extends HomeEvent{
  const LoadJobListEvent();

  @override
  List<Object?> get props =>[];
}
