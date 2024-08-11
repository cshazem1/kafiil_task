
import 'package:flutter/cupertino.dart';
import 'package:kafiil_task/features/services/data/services_model/ServiceModel.dart';

@immutable
sealed class PopularServicesState {}

final class PopularServicesInitial extends PopularServicesState {}
//PopularServices

final class PopularServicesSuccess extends PopularServicesState {

  ServiceModel serviceModel;
  PopularServicesSuccess({required this.serviceModel});
}
final class PopularServicesFailure extends PopularServicesState {
  String message;
  PopularServicesFailure({required this.message});
}
final class PopularServicesLoading extends PopularServicesState {}
