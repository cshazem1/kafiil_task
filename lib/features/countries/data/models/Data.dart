class Data {
  Data({
      this.id, 
      this.countryCode, 
      this.name, 
      this.capital,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    countryCode = json['country_code'];
    name = json['name'];
    capital = json['capital'];
  }
  int? id;
  String? countryCode;
  String? name;
  String? capital;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['country_code'] = countryCode;
    map['name'] = name;
    map['capital'] = capital;
    return map;
  }

}