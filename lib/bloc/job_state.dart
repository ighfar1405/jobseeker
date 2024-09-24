// lib/bloc/job_state.dart
import 'package:equatable/equatable.dart';
import '../models/job.dart'; // user_state.dart

abstract class JobState extends Equatable {
  @override
  List<Object> get props => [];
}

class JobInitial extends JobState {}

class JobLoading extends JobState {}

class JobsLoaded extends JobState {
  final List<Job> jobs;

  JobsLoaded(this.jobs);

  @override
  List<Object> get props => [jobs];
}

class JobLoaded extends JobState {
  final Job job;

  JobLoaded(this.job);

  @override
  List<Object> get props => [job];
}

class JobError extends JobState {
  final String message;

  JobError(this.message);

  @override
  List<Object> get props => [message];
}
