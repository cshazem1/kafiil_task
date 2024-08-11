part of 'country_cubit.dart';

@immutable
sealed class CountryState {}

final class CountryInitial extends CountryState {}
final class CountrySuccess extends CountryState {
  Country country;
  CountrySuccess({required this.country});

}
final class CountryLoading extends CountryState {}
final class CountryFailure extends CountryState {
  String message;
  CountryFailure({required this.message});
}
