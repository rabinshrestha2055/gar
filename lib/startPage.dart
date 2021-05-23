import 'package:flutter/material.dart';
import 'package:garjoo/models/loginUser.dart';
import 'package:provider/provider.dart';

import 'controller/provider/providers.dart';

import 'screens/homePage.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key key}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  Future userDetails;
  UserDetailsProvider user = UserDetailsProvider();
  @override
  void initState() {
    userDetails = user.loginUser();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserDetailsProvider(),
      child: Consumer<UserDetailsProvider>(
        builder: (context, value, child) => FutureBuilder(
            future: userDetails,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                var response = snapshot.data as LoginUserModel;

                return response == null
                    ? HomePage(
                        email: null,
                        userName: null,
                      )
                    : HomePage(
                        id: response.id,
                        email: response.email,
                        userName: response.username,
                      );
              } else {
                return Container(
                  color: Colors.white,
                );
              }
            }),
      ),
    );
  }
}
