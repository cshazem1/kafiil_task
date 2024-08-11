import 'Links.dart';

class Pagination {
  Pagination({
      this.count, 
      this.total, 
      this.perPage, 
      this.currentPage, 
      this.totalPages, 
      this.links,});

  Pagination.fromJson(dynamic json) {
    count = json['count'];
    total = json['total'];
    perPage = json['perPage'];
    currentPage = json['currentPage'];
    totalPages = json['totalPages'];
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
  }
  int? count;
  int? total;
  int? perPage;
  int? currentPage;
  int? totalPages;
  Links? links;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    map['total'] = total;
    map['perPage'] = perPage;
    map['currentPage'] = currentPage;
    map['totalPages'] = totalPages;
    if (links != null) {
      map['links'] = links?.toJson();
    }
    return map;
  }

}