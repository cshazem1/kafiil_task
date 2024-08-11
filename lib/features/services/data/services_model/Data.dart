class ServicesData {
  ServicesData({
      this.id, 
      this.mainImage, 
      this.price, 
      this.discount, 
      this.priceAfterDiscount, 
      this.title, 
      this.averageRating, 
      this.completedSalesCount, 
      this.recommended,});

  ServicesData.fromJson(dynamic json) {
    id = json['id'];
    mainImage = json['main_image'];
    price = json['price'];
    discount = json['discount'];
    priceAfterDiscount = json['price_after_discount'];
    title = json['title'];
    averageRating = json['average_rating'];
    completedSalesCount = json['completed_sales_count'];
    recommended = json['recommended'];
  }
  int? id;
  String? mainImage;
  int? price;
  dynamic discount;
  int? priceAfterDiscount;
  String? title;
  int? averageRating;
  int? completedSalesCount;
  bool? recommended;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['main_image'] = mainImage;
    map['price'] = price;
    map['discount'] = discount;
    map['price_after_discount'] = priceAfterDiscount;
    map['title'] = title;
    map['average_rating'] = averageRating;
    map['completed_sales_count'] = completedSalesCount;
    map['recommended'] = recommended;
    return map;
  }

}