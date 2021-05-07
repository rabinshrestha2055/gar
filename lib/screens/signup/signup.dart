import 'package:flutter/material.dart';
import 'package:garjoo/core.dart';
import 'package:garjoo/screens/signup/seller.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {});
  }

  // bool isTab=true;
  List<Widget> tabItems = [
    Customer(),
    Seller(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: titleBar,
      body: Padding(
        padding: const EdgeInsets.only(top: 40, right: 10, left: 10),
        child: DefaultTabController(
          initialIndex: 0,
          length: 2,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 16.0, right: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: Colors.red[100],
                ),
                height: 55,
                child: TabBar(
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    color: Colors.red[400],
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  controller: _tabController,
                  tabs: [
                    Tab(
                      child: Text('Customer', style: TextStyle(fontSize: 18)),
                    ),
                    Tab(child: Text('Seller', style: TextStyle(fontSize: 18))),
                  ],
                ),
              ),
              Expanded(
                  child: TabBarView(
                      controller: _tabController, children: tabItems))
            ],
          ),
        ),
      ),
    );
  }
}
