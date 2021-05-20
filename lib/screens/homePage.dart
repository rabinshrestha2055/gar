import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:garjoo/core.dart';
import 'package:garjoo/core/store.dart';
import 'package:garjoo/models/cart_model.dart';

import 'package:garjoo/widget/loginFirst.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  final String email;
  final int id;
  final String userName;

  HomePage({Key key, this.email, this.userName, this.id}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;

    List<Widget> tabItems = [
      Home(
        id: widget.id,
        email: widget.email,
        userName: widget.userName,
      ),
      widget.email == null ? LoginFirst() : Review(),
      Cart(
        email: widget.email,
        userName: widget.userName,
      ),
      widget.email == null
          ? LoginFirst()
          : Profile(
              email: widget.email,
            ),
    ];

    return ChangeNotifierProvider(
      create: (context) => BottomNavProvider(),
      child: Consumer<BottomNavProvider>(
        builder: (context, value, child) => Scaffold(
          body: tabItems[value.getCurrentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: value.getCurrentIndex,
            onTap: (index) => value.setCurrentIndex = index,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.rate_review_outlined), label: "Review"),
              BottomNavigationBarItem(
                  icon: VxBuilder(
                    mutations: {AddMutation, RemoveMutation},
                    builder: (context, _) => Icon(CupertinoIcons.cart).badge(
                        color: Colors.red, size: 12, count: _cart.items.length),
                  ),
                  label: "Cart"),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.person), label: "Profile"),
            ],
          ),
        ),
      ),
    );
  }
}
