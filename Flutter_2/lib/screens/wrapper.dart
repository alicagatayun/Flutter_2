import 'package:dikmen/models/user.dart';
import 'package:dikmen/UI/LoginPage/authenticate.dart';
import 'package:dikmen/UI/MainPage/main.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //return either Home or Authenticate widget
    final user = Provider.of<User>(context);
    if (user == null) {
      return Authenticate();
    } else {
      return HomeScreen(loginUser: user);
    }
  }
}
