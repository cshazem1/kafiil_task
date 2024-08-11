
import '../../../data/services_model/ServiceModel.dart';

abstract class ServicesState {}

//Services
final class ServicesInitial extends ServicesState {}
final class ServicesSuccess extends ServicesState {
  ServiceModel serviceModel;
  ServicesSuccess({required this.serviceModel});
}
final class ServicesFailure extends ServicesState {
  String message;
  ServicesFailure({required this.message});
}
final class ServicesLoading extends ServicesState {}


