part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class LoadingJobListState extends HomeState {}

final class LoadedJobListState extends HomeState {
  final List<Job> jobList;

  LoadedJobListState(this.jobList);
}

final class ErrorJobListState extends HomeState {
  final String message;

  ErrorJobListState(this.message);
}

class NetworkFailedState extends HomeState {
  final String message;

  NetworkFailedState(this.message);
}
