import 'package:flutter/material.dart';
import 'package:garjoo/core.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BottomNavProvider(),
      child: Consumer<BottomNavProvider>(
        builder: (context, value, child) => Scaffold(
          body: value.getTabItem[value.getCurrentIndex],
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
