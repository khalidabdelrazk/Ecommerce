import 'package:ecommerce/features/home%20tab/domain/entity/categories_or_brands_response_entity.dart';

class CategoriesOrBrandsResponseDm extends CategoriesOrBrandsResponseEntity {
  final int? results;
  final String? message;

  CategoriesOrBrandsResponseDm({
    this.message,
    this.results,
    super.metadata,
    super.data,
  });

  factory CategoriesOrBrandsResponseDm.fromJson(Map<String, dynamic> json) {
    return CategoriesOrBrandsResponseDm(
      message: json['message'],
      results: json['results'],
      metadata: MetadataCategoriesOrBrandsResponseDm.fromJson(json['metadata']),
      data: (json['data'] as List)
          .map((item) => CategoryOrBrandsDm.fromJson(item))
          .toList(),
    );
  }
}

class MetadataCategoriesOrBrandsResponseDm extends MetadataCategoriesOrBrandsResponseEntity {
  MetadataCategoriesOrBrandsResponseDm({super.currentPage, super.numberOfPages, super.limit});

  factory MetadataCategoriesOrBrandsResponseDm.fromJson(Map<String, dynamic> json) {
    return MetadataCategoriesOrBrandsResponseDm(
      currentPage: json['currentPage'],
      numberOfPages: json['numberOfPages'],
      limit: json['limit'],
    );
  }
}

class CategoryOrBrandsDm extends CategoryOrBrandsEntity {
  final DateTime? createdAt;
  final DateTime? updatedAt;
  CategoryOrBrandsDm({
    super.id,
    super.name,
    super.slug,
    super.image,
    this.createdAt,
    this.updatedAt,
  });

  factory CategoryOrBrandsDm.fromJson(Map<String, dynamic> json) {
    return CategoryOrBrandsDm(
      id: json['_id'],
      name: json['name'],
      slug: json['slug'],
      image: json['image'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}