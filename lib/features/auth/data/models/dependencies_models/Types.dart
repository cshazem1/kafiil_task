class Types {
  Types({
      this.value,
      this.label,});

  Types.fromJson(dynamic json) {
    value = json['value'];
    label = json['label'];
  }
  int? value;
  String? label;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['value'] = value;
    map['label'] = label;
    return map;
  }

}