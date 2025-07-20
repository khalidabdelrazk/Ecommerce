import 'package:ecommerce/features/home%20tab/domain/entity/categories_or_brands_response_entity.dart';

class GetProductsResponseEntity {
  final List<ProductEntity>? data;

  GetProductsResponseEntity({
    this.data,
  });

  factory GetProductsResponseEntity.fromJson(Map<String, dynamic> json) {
    return GetProductsResponseEntity(
      data: (json['data'] as List)
          .map((item) => ProductEntity.fromJson(item))
          .toList(),
    );
  }
}

class MetadataProductResponse extends MetadataCategoriesOrBrandsResponseEntity{
  MetadataProductResponse({
    super.currentPage,
    super.numberOfPages,
    super.limit,});

  factory MetadataProductResponse.fromJson(Map<String, dynamic> json) {
    return MetadataProductResponse(
      currentPage: json['currentPage'],
      numberOfPages: json['numberOfPages'],
      limit: json['limit'],
    );
  }
}

class ProductEntity {
  final String? id;
  final String? title;
  final String? description;
  final int? price;
  final String? imageCover;
  final List<String>? images;
  final double? ratingsAverage;

  ProductEntity({this.title, 
    this.id,
    this.description,
    this.price,
    this.imageCover,
    this.images,
    this.ratingsAverage,
  });

  factory ProductEntity.fromJson(Map<String, dynamic> json) {
    return ProductEntity(
      id: json['_id'],
      description: json['description'],
      price: json['price'],
      imageCover: json['imageCover'],
      images: List<String>.from(json['images']),
      ratingsAverage: (json['ratingsAverage'] as num).toDouble(),
    );
  }

  toJson() {
    return {
      '_id': id,
      'description': description,
      'price': price,
      'imageCover': imageCover,
      'images': images,
      'ratingsAverage': ratingsAverage,
    };
  }
}

class SubcategoryEntity extends CategoryOrBrandsEntity {

  final String? category;

  SubcategoryEntity({
    super.id,
    super.name,
    this.category,
  });

  factory SubcategoryEntity.fromJson(Map<String, dynamic> json) {
    return SubcategoryEntity(
      id: json['_id'],
      name: json['name'],
      category: json['category'],
    );
  }
}

class CategoryEntity extends CategoryOrBrandsEntity {


  CategoryEntity({
    super.id,
    super.name,
    super.image,
  });

  factory CategoryEntity.fromJson(Map<String, dynamic> json) {
    return CategoryEntity(
      id: json['_id'],
      name: json['name'],
      image: json['image'],
    );
  }
}

class BrandEntity extends CategoryOrBrandsEntity {

  BrandEntity({
    super.id,
    super.name,
    super.image,
  });

  factory BrandEntity.fromJson(Map<String, dynamic> json) {
    return BrandEntity(
      id: json['_id'],
      name: json['name'],
      image: json['image'],
    );
  }
}
