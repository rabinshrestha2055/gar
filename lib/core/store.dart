import 'package:garjoo/models/cart_model.dart';
import 'package:garjoo/models/similar.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore {
  ProductModel product;
  CartModel cart;
  MyStore() {
    product = ProductModel();
    cart = CartModel();
    cart.product = product;
  }
}
