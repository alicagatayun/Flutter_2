import 'package:dikmen/BackEnd/auth.dart';
import 'package:dikmen/models/user.dart';
import 'package:dikmen/screens/wrapper.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
