class Links {
  Links({
      this.next,});

  Links.fromJson(dynamic json) {
    next = json['next'];
  }
  String? next;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['next'] = next;
    return map;
  }

}