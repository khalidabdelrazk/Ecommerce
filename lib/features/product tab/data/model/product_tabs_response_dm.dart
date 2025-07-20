import 'package:ecommerce/features/product%20tab/domain/entity/product_tabs_response_entity.dart';

class ProductTabsResponseDm extends ProductTabsResponseEntity {
  final int? results;
  final String? message;

  ProductTabsResponseDm({
    this.message,
    this.results,
    super.metadata,
    super.data,
  });

  factory ProductTabsResponseDm.fromJson(
    Map<String, dynamic> json1,
    String categoryType1,
    Map<String, dynamic> json2,
    String categoryType2,
  ) {
    return ProductTabsResponseDm(
      message: json1['message'],
      results: json1['results'],
      metadata: MetadataCategoriesAndBrandsResponseDm.fromJson(json1['metadata']),
      data: [
        ...(json1['data'] as List)
            .map((item) => CategoryAndBrandsDm.fromJsonWithType(item, categoryType1)),
        ...(json2['data'] as List)
            .map((item) => CategoryAndBrandsDm.fromJsonWithType(item, categoryType2)),
      ],
    );
  }
}

class MetadataCategoriesAndBrandsResponseDm extends MetadataProductTabsResponseEntity {
  MetadataCategoriesAndBrandsResponseDm({
    super.currentPage,
    super.numberOfPages,
    super.limit,
  });

  factory MetadataCategoriesAndBrandsResponseDm.fromJson(Map<String, dynamic> json) {
    return MetadataCategoriesAndBrandsResponseDm(
      currentPage: json['currentPage'],
      numberOfPages: json['numberOfPages'],
      limit: json['limit'],
    );
  }
}

class CategoryAndBrandsDm extends CategoryAndBrandsEntity {
  final DateTime? createdAt;
  final DateTime? updatedAt;

  CategoryAndBrandsDm({
    super.id,
    super.name,
    super.slug,
    super.type,
    super.image,
    this.createdAt,
    this.updatedAt,
  });

  factory CategoryAndBrandsDm.fromJsonWithType(Map<String, dynamic> json, String forcedType) {
    return CategoryAndBrandsDm(
      id: json['_id'],
      name: json['name'],
      slug: json['slug'],
      image: json['image'],
      type: forcedType,
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}
