import 'package:bloc/bloc.dart';
import 'package:job_app/models/response.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import '../../../models/job.dart';
import '../../../repositories/home_repository.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository homeRepository;

  HomeBloc(this.homeRepository) : super(HomeInitial()) {
    on<LoadJobListEvent>((event, emit) async {
      emit(LoadingJobListState());

      try {
        final Response response = await homeRepository.jobData({});
        if (response.status == "200") {
          final responseData = response.data;
          final List<dynamic> jsonResponseData = responseData;
          final List<Job> mappedResponseData = jsonResponseData.map((item) => Job.fromJson(item)).toList();
          emit(LoadedJobListState(mappedResponseData));
        } else {
          emit(ErrorJobListState(response.message));
        }
      } catch (e) {
        emit(NetworkFailedState("Network Error"));
      }
    });
  }
}
