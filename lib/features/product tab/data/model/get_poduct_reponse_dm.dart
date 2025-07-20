
import 'package:ecommerce/features/product%20tab/domain/entity/get_products_response_entity.dart';

class GetProductsResponseDm extends GetProductsResponseEntity {
  final int? results;
  final Metadata? metadata;

  GetProductsResponseDm({
    this.results,
    this.metadata,
    super.data,
  });

  factory GetProductsResponseDm.fromJson(Map<String, dynamic> json) {
    return GetProductsResponseDm(
      results: json['results'],
      metadata: Metadata.fromJson(json['metadata']),
      data: (json['data'] as List)
          .map((item) => ProductDm.fromJson(item))
          .toList(),
    );
  }
}

class Metadata extends MetadataProductResponse{

  Metadata({
    super.currentPage,
    super.numberOfPages,
    super.limit,});

  factory Metadata.fromJson(Map<String, dynamic> json) {
    return Metadata(
      currentPage: json['currentPage'],
      numberOfPages: json['numberOfPages'],
      limit: json['limit'],
    );
  }
}

class ProductDm extends ProductEntity {
  final String? title;
  final String? slug;
  final int? quantity;
  final int? ratingsQuantity;
  final int? sold;
  final List<SubcategoryDm>? subcategory;
  final CategoryDm? category;
  final BrandDm? brand;
  final String? createdAt;
  final String? updatedAt;

  ProductDm({
    super.id,
    this.title,
    this.slug,
    super.description,
    super.price,
    super.imageCover,
    super.images,
    this.quantity,
    super.ratingsAverage,
    this.ratingsQuantity,
    this.sold,
    this.subcategory,
    this.category,
    this.brand,
    this.createdAt,
    this.updatedAt,
  });

  factory ProductDm.fromJson(Map<String, dynamic> json) {
    return ProductDm(
      id: json['_id'],
      title: json['title'],
      slug: json['slug'],
      description: json['description'],
      price: json['price'],
      imageCover: json['imageCover'],
      images: List<String>.from(json['images']),
      quantity: json['quantity'],
      ratingsAverage: (json['ratingsAverage'] as num).toDouble(),
      ratingsQuantity: json['ratingsQuantity'],
      sold: json['sold'],
      subcategory: (json['subcategory'] as List)
          .map((item) => SubcategoryDm.fromJson(item))
          .toList(),
      category: CategoryDm.fromJson(json['category']),
      brand: BrandDm.fromJson(json['brand']),
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}

class SubcategoryDm extends SubcategoryEntity {
  SubcategoryDm({
    super.id,
    super.name,
    super.category,
  });

  factory SubcategoryDm.fromJson(Map<String, dynamic> json) {
    return SubcategoryDm(
      id: json['_id'],
      name: json['name'],
      category: json['category'],
    );
  }
}

class CategoryDm extends CategoryEntity {

  CategoryDm({
    super.id,
    super.name,
    super.image,
  });

  factory CategoryDm.fromJson(Map<String, dynamic> json) {
    return CategoryDm(
      id: json['_id'],
      name: json['name'],
      image: json['image'],
    );
  }
}

class BrandDm extends BrandEntity {

  BrandDm({
    super.id,
    super.name,
    super.image,
  });

  factory BrandDm.fromJson(Map<String, dynamic> json) {
    return BrandDm(
      id: json['_id'],
      name: json['name'],
      image: json['image'],
    );
  }
}
