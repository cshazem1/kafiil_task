part of 'dependent_cubit.dart';

@immutable
sealed class DependentState {}

final class DependentInitial extends DependentState {}
final class DependentSuccess extends DependentState {
  DependenciesModels dependenciesModels;
  DependentSuccess({required this.dependenciesModels});
}
final class DependentLoading extends DependentState {}
final class DependentFailure extends DependentState {
  String message;
  DependentFailure({required this.message});
}
