import 'package:kafiil_task/features/auth/data/models/auth_model/auth_model.dart';


class LoginModels {
  LoginModels({
      this.status, 
      this.success, 
      this.data, 
      this.accessToken,});

  LoginModels.fromJson(dynamic json) {
    status = json['status'];
    success = json['success'];
    data = json['data'] != null ? AuthModel.fromJson(json['data']) : null;
    accessToken = json['access_token'];
  }
  int? status;
  bool? success;
  AuthModel? data;
  String? accessToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['success'] = success;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['access_token'] = accessToken;
    return map;
  }

}