// lib/bloc/job_event.dart// user_event.dart
// job_event.dart
import 'package:equatable/equatable.dart';

abstract class JobEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchJobs extends JobEvent {}

class FetchJobDetail extends JobEvent {
  final int jobId;

  FetchJobDetail(this.jobId);

  @override
  List<Object> get props => [jobId];
}

class SearchJobs extends JobEvent {
  final String query;

  SearchJobs(this.query);

  @override
  List<Object> get props => [query];
}
