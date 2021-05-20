import 'package:flutter/material.dart';
import 'package:garjoo/core.dart';
import 'package:garjoo/core/store.dart';
import 'package:garjoo/models/cart_model.dart';
import 'package:velocity_x/velocity_x.dart';

class Cart extends StatefulWidget {
  final userName;
  final email;

  const Cart({Key key, this.userName, this.email}) : super(key: key);
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  final CartModel _cart = (VxState.store as MyStore).cart;
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: Image.asset(
            'asset/garjoologo.png',
            height: 150,
            width: 150,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SizedBox(
              height: 200,
              child: Padding(
                padding: const EdgeInsets.only(left: 0.0),
                child: Column(
                  children: [
                    _cart.items.isEmpty
                        ? "Your cart is empty"
                            .text
                            .xl3
                            .make()
                            .centered()
                            .expand()
                        : Expanded(
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: _cart.items?.length,
                              itemBuilder: (context, index) => Card(
                                margin: EdgeInsets.only(
                                    left: 10, right: 10, bottom: 10),
                                elevation: 0.0,
                                child: ListTile(
                                  leading: Image.network(
                                    "https://api.garjoo.com" +
                                        _cart.items[index].thumbnail,
                                  ),
                                  trailing: IconButton(
                                    icon: Icon(Icons.remove_circle_outline),
                                    onPressed: () {
                                      RemoveMutation(_cart.items[index]);
                                    },
                                  ),
                                  title: _cart.items[index].title == null
                                      ? _cart.items[index].name.text.make()
                                      : _cart.items[index].title.text.make(),
                                  subtitle: "Rs${_cart.items[index].price}"
                                      .text
                                      .make(),
                                ),
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            ),
          ),
          _cart.items.isEmpty
              ? Container()
              : Padding(
                  padding: const EdgeInsets.only(
                    left: 20.0,
                    right: 20.0,
                  ),
                  child: Card(
                    elevation: 0.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'TOTAL',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 13),
                            ),
                            VxConsumer(
                              mutations: {RemoveMutation},
                              builder: (context, status) {
                                return "\$${_cart.totalPrice}"
                                    .text
                                    .xl4
                                    .color(context.accentColor)
                                    .make();
                              },
                              notifications: {},
                            ),
                            Text(
                              _cart.items.length.toString() + " Items",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 13),
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => Checkout(
                                          email: widget.email,
                                          userName: widget.userName,
                                        )));
                          },
                          child: Container(
                              height: 40,
                              width: 150,
                              decoration: BoxDecoration(
                                  color: red,
                                  borderRadius: BorderRadius.circular(18)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Text(
                                    'Proceed to checkout',
                                    style:
                                        TextStyle(color: white, fontSize: 12),
                                  ),
                                ),
                              )),
                        )
                      ],
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
