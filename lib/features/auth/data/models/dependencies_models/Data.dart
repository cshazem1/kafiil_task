import 'Types.dart';
import 'Tags.dart';
import 'SocialMedia.dart';

class DataDependent {
  DataDependent({
      this.types, 
      this.tags, 
      this.socialMedia,});

  DataDependent.fromJson(dynamic json) {
    if (json['types'] != null) {
      types = [];
      json['types'].forEach((v) {
        types?.add(Types.fromJson(v));
      });
    }
    if (json['tags'] != null) {
      tags = [];
      json['tags'].forEach((v) {
        tags?.add(Tags.fromJson(v));
      });
    }
    if (json['social_media'] != null) {
      socialMedia = [];
      json['social_media'].forEach((v) {
        socialMedia?.add(SocialMedia.fromJson(v));
      });
    }
  }
  List<Types>? types;
  List<Tags>? tags;
  List<SocialMedia>? socialMedia;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (types != null) {
      map['types'] = types?.map((v) => v.toJson()).toList();
    }
    if (tags != null) {
      map['tags'] = tags?.map((v) => v.toJson()).toList();
    }
    if (socialMedia != null) {
      map['social_media'] = socialMedia?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}