class GetProductsRequestBody {
  final int? limit;
  final String? sort;
  final String? fields;
  final int? page;
  final String? keyword;
  final String? brand;
  final num? priceGte;
  final num? priceLte;
  final String? categoryIn;

  GetProductsRequestBody({
    this.limit,
    this.sort,
    this.fields,
    this.page,
    this.keyword,
    this.brand,
    this.priceGte,
    this.priceLte,
    this.categoryIn,
  });
  Map<String, dynamic> toJson() {
    return {
      'limit': 10,
      // 'sort': sort,
      // 'fields': fields,
      // 'page': page,
      if (brand != null) 'brand': brand,
      if (categoryIn != null) 'category[in]': categoryIn,
    };
  }
}


/*

limit
2

sort
-price

fields
title,price

select fields

price[gte]
100

filtering

page
2

keyword
new

brand
6212b6b488f2cee15c5db3c8

price[lte]
13

category[in]
6212b67488f2cee15c5db3ba

category[in]
61f3157c6bdf4c518f9bbcb9
*/
