import 'package:flutter/material.dart';
import 'package:garjoo/core.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SharedPreferences data;

  String email;

  @override
  void initState() {
    super.initState();
    initial();
  }

  void initial() async {
    data = await SharedPreferences.getInstance();
    setState(() {
      email = data.getString('email');
    });
  }

  List<Widget> tabItems = [
    Home(),
    Review(),
    Cart(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
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
