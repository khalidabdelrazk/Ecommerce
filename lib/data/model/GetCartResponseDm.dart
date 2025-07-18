

import 'package:ecommerce/data/model/ProductResponseDm.dart';
import 'package:ecommerce/domain/entities/GetCartResponseEntity.dart';

class GetCartResponseDm extends GetCartResponseEntity {
  GetCartResponseDm({
    super.status,
    super.numOfCartItems,
    this.statusMsg,
    this.message,
    super.cartId,
    super.data,
  });

  GetCartResponseDm.fromJson(dynamic json) {
    status = json['status'];
    statusMsg = json['statusMsg'];
    message = json['message'];
    numOfCartItems = json['numOfCartItems'];
    cartId = json['cartId'];
    data = json['data'] != null ? GetDataDm.fromJson(json['data']) : null;
  }

  String? statusMsg;

  String? message;
}

class GetDataDm extends GetDataEntity {
  GetDataDm({
    super.id,
    super.cartOwner,
    super.products,
    super.createdAt,
    super.updatedAt,
    super.v,
    super.totalCartPrice,
  });

  GetDataDm.fromJson(dynamic json) {
    id = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(GetProductDm.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }
}

class GetProductDm extends GetProductEntity {
  GetProductDm({
    super.count,
    super.id,
    super.product,
    super.price,
  });

  GetProductDm.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product =
        json['product'] != null ? ProductDm.fromJson(json['product']) : null;
    price = json['price'];
  }
}
