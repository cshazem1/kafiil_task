import 'Data.dart';

class ServiceModel {
  ServiceModel({
      this.status, 
      this.success, 
      this.data,});

  ServiceModel.fromJson(dynamic json) {
    status = json['status'];
    success = json['success'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(ServicesData.fromJson(v));
      });
    }
  }
  int? status;
  bool? success;
  List<ServicesData>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['success'] = success;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}