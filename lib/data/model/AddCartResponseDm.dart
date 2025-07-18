
import 'package:ecommerce/domain/entities/AddCartResponseEntity.dart';

class AddCartResponseDm extends AddCartResponseEntity {
  AddCartResponseDm({
    super.status,
    super.message,
    this.statusMsg,
    super.numOfCartItems,
    super.cartId,
    super.data,
  });

  AddCartResponseDm.fromJson(dynamic json) {
    status = json['status'];
    statusMsg = json['statusMsg'];
    message = json['message'];
    numOfCartItems = json['numOfCartItems'];
    cartId = json['cartId'];
    data = json['data'] != null ? DataDm.fromJson(json['data']) : null;
  }

  String? statusMsg;
}

class DataDm extends DataEntity {
  DataDm({
    super.id,
    super.cartOwner,
    super.products,
    super.createdAt,
    super.updatedAt,
    super.v,
    super.totalCartPrice,
  });

  DataDm.fromJson(dynamic json) {
    id = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(AddProductDm.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }
}

class AddProductDm extends AddProductEntity {
  AddProductDm({
    super.count,
    super.id,
    super.product,
    super.price,
  });

  AddProductDm.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product = json['product'];
    price = json['price'];
  }
}
