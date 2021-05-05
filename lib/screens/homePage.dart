import 'package:flutter/material.dart';
import 'package:garjoo/core.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  final String email;
  final String userName;
  var cart;
  var sum;

  HomePage({Key key, this.email, this.userName, this.sum, this.cart})
      : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    List<Widget> tabItems = [
      Home(
        email: widget.email,
        userName: widget.userName,
      ),
      Review(),
      Cart(),
      Profile(),
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
            items: value.getBottomNav
                .map((eachTab) => BottomNavigationBarItem(
                    icon: eachTab.icon, label: eachTab.name))
                .toList(),
          ),
        ),
      ),
    );
  }
}
