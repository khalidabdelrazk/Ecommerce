class CategoriesOrBrandsResponseEntity {
  final MetadataCategoriesOrBrandsResponseEntity? metadata;
  final List<CategoryOrBrandsEntity>? data;

  CategoriesOrBrandsResponseEntity({this.metadata, this.data});

  factory CategoriesOrBrandsResponseEntity.fromJson(Map<String, dynamic> json) {
    return CategoriesOrBrandsResponseEntity(
      metadata: MetadataCategoriesOrBrandsResponseEntity.fromJson(
        json['metadata'],
      ),
      data: (json['data'] as List)
          .map((item) => CategoryOrBrandsEntity.fromJson(item))
          .toList(),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'metadata': metadata?.toJson(),
      'data': data?.map((category) => category.toJson()).toList(),
    };
  }
}

class MetadataCategoriesOrBrandsResponseEntity {
  final int? currentPage;
  final int? numberOfPages;
  final int? limit;

  MetadataCategoriesOrBrandsResponseEntity({
    this.currentPage,
    this.numberOfPages,
    this.limit,
  });

  factory MetadataCategoriesOrBrandsResponseEntity.fromJson(
    Map<String, dynamic> json,
  ) {
    return MetadataCategoriesOrBrandsResponseEntity(
      currentPage: json['currentPage'],
      numberOfPages: json['numberOfPages'],
      limit: json['limit'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'currentPage': currentPage,
      'numberOfPages': numberOfPages,
      'limit': limit,
    };
  }
}

class CategoryOrBrandsEntity {
  final String? id;
  final String? name;
  final String? slug;
  final String? image;
  CategoryOrBrandsEntity({this.id, this.name, this.slug, this.image});

  factory CategoryOrBrandsEntity.fromJson(Map<String, dynamic> json) {
    return CategoryOrBrandsEntity(
      id: json['_id'],
      name: json['name'],
      slug: json['slug'],
      image: json['image'],
    );
  }
  Map<String, dynamic> toJson() {
    return {'_id': id, 'name': name, 'slug': slug, 'image': image};
  }
}