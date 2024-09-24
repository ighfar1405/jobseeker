// lib/bloc/job_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'job_event.dart';
import 'job_state.dart';
import '../services/job_service.dart';

class JobBloc extends Bloc<JobEvent, JobState> {
  final JobService jobService;

  JobBloc({required this.jobService}) : super(JobInitial()) {
    on<FetchJobs>(_onFetchJobs);
    on<SearchJobs>(_onSearchJobs);
    on<FetchJobDetail>(_onFetchJobDetail);
  }

  Future<void> _onFetchJobs(FetchJobs event, Emitter<JobState> emit) async {
    emit(JobLoading());
    try {
      final jobs = await jobService.fetchJobs();
      emit(JobsLoaded(jobs));
    } catch (e) {
      emit(JobError(e.toString()));
    }
  }

  Future<void> _onFetchJobDetail(
      FetchJobDetail event, Emitter<JobState> emit) async {
    emit(JobLoading());
    try {
      final job = await jobService.FetchJobDetail(event.jobId);
      if (job != null) {
        emit(JobLoaded(job));
      } else {
        emit(JobError('Job not found'));
      }
    } catch (e) {
      emit(JobError(e.toString()));
    }
  }

  Future<void> _onSearchJobs(SearchJobs event, Emitter<JobState> emit) async {
    emit(JobLoading());
    try {
      final jobs = await jobService.searchJobs(event.query);
      emit(JobsLoaded(jobs));
    } catch (e) {
      emit(JobError(e.toString()));
    }
  }
}
