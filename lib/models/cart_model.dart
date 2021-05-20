import 'package:garjoo/core/store.dart';
import 'package:garjoo/models/similar.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  ProductModel _product;
  final List<int> _itemIds = [];

  ProductModel get product => _product;

  set product(ProductModel productModel) {
    assert(productModel != null);
    _product = productModel;
  }

  //Get items in the cart
  List<Item> get items => _itemIds.map((id) => _product.getById(id)).toList();

  //Get total price

  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);
  @override
  perform() {
    store.cart._itemIds.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;

  RemoveMutation(this.item);

  @override
  perform() {
    store.cart._itemIds.remove(item.id);
  }
}
