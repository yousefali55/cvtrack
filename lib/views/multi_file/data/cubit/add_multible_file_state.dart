part of 'add_multible_file_cubit.dart';

@immutable
sealed class AddMultibleFileState {}

final class AddMultibleFileInitial extends AddMultibleFileState {}
final class AddMultibleFileLoading extends AddMultibleFileState {}
final class AddMultibleFileSuccess extends AddMultibleFileState {}
final class AddMultibleFileFailure extends AddMultibleFileState {
  final String errorMessage;
  AddMultibleFileFailure({required this.errorMessage});
}
final class AddMultibleFileAndTrackItInitial extends AddMultibleFileState {}
final class AddMultibleFileAndTrackItLoading extends AddMultibleFileState {}
final class AddMultibleFileAndTrackItSuccess extends AddMultibleFileState {
  final ResumeResult bestResume;
  final List<ResumeResult> results;

  AddMultibleFileAndTrackItSuccess({required this.bestResume, required this.results});
}
final class AddMultibleFileAndTrackItFailure extends AddMultibleFileState {
  final String errorMessage;

  AddMultibleFileAndTrackItFailure({required this.errorMessage});
}
