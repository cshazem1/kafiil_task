class SocialMedia {
  SocialMedia({
      this.value, 
      this.label,});

  SocialMedia.fromJson(dynamic json) {
    value = json['value'];
    label = json['label'];
  }
  String? value;
  String? label;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['value'] = value;
    map['label'] = label;
    return map;
  }

}