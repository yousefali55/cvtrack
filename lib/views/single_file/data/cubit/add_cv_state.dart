part of 'add_cv_cubit.dart';
@immutable
sealed class AddCvState {}

final class AddCvInitial extends AddCvState {}
final class AddCvLoading extends AddCvState {}
final class AddCvSuccess extends AddCvState {}
final class AddCvFailure extends AddCvState {
  final String errorMessage;
  AddCvFailure({required this.errorMessage});
}
final class AddCvAndTrackInitial extends AddCvState {}
final class AddCvAndTrackLoading extends AddCvState {}
final class AddCvAndTrackSuccess extends AddCvState {
  final ResumeRate resumeRate;

  AddCvAndTrackSuccess({required this.resumeRate});
}
final class AddCvAndTrackFailure extends AddCvState {
  final String errorMessage;
  AddCvAndTrackFailure({required this.errorMessage});
}
