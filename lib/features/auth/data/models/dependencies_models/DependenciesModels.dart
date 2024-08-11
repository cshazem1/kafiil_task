import 'Data.dart';

class DependenciesModels {
  DependenciesModels({
      this.status, 
      this.success, 
      this.data,});

  DependenciesModels.fromJson(dynamic json) {
    status = json['status'];
    success = json['success'];
    data = json['data'] != null ? DataDependent.fromJson(json['data']) : null;
  }
  int? status;
  bool? success;
  DataDependent? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['success'] = success;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}