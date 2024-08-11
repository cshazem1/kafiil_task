import 'dart:io';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

class AuthModel {
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? confirmPassword;
  String? userType;
  String? about;
  int? salary;
  String? birthDate;
  int? gender;
  String? skills;
  List<dynamic>favoriteSocialMedia;
  XFile? galleryFile;
  MultipartFile? multipartFile;
  String? avatar;
  int? id;
  List<TagsAuth>? tags;
  List<num>?tagsId;
  UserType? type;
  AuthModel(
      {this.password,this.multipartFile
        ,this.id,this.type,
      this.firstName,
      this.lastName,
      this.about,
      this.tags,
        List<dynamic>?favoriteSocialMedia,
        this.salary,
      this.email,
      this.birthDate,
        this.confirmPassword,
      this.gender,
      this.avatar}) : favoriteSocialMedia = favoriteSocialMedia ?? [];

  factory AuthModel.fromJson(json) {
    return AuthModel(
      birthDate: json['birth_date'],
      id: json["id"],
      firstName: json['first_name'],
      lastName: json['last_name'],
      about: json['about'],
      tags: TagsAuth.listOfTags(json["tags"]),
      avatar: json['avatar'],
      salary: json['salary'],
      email: json['email'],
      gender: json['gender'],
      type: json['type'] != null ? UserType.fromJson(json['type']) : null,
      favoriteSocialMedia: json['favorite_social_media']

    );
  }
  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,
      'last_name':lastName,
      'salary': salary,
      "favorite_social_media": [favoriteSocialMedia],
      "password_confirmation": confirmPassword,
      "password": password,
      'tags':[tagsId] ,
      'about': about,
      'email': email, 'birth_date': birthDate..toString(),
      'type': type!.code,

    'avatar':multipartFile
    };
}}

class TagsAuth {
  dynamic id;
  String? name;
  TagsAuth({this.id, this.name});
  factory TagsAuth.fromJson(json) {
    return TagsAuth(id: json['id'], name: json['name']);
  }

  static List<TagsAuth> listOfTags(List json) {
    List<TagsAuth> list = [];
    for (var i in json) {
      list.add(TagsAuth.fromJson(i));
    }
    return list;
  }
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TagsAuth && other.id == id;
  }

  // تجاوز دالة hashCode
  @override
  int get hashCode => id.hashCode;
}

class UserType {
  int? code;
  String? name;
  String? niceName;
  UserType({this.name, this.code, this.niceName});
  factory UserType.fromJson(json) {
    return UserType(
        name: json['name'], code: json['code'], niceName: json["nice_name"]);
  }

}
