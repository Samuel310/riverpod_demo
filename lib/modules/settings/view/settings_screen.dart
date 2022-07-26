import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:riverpod_demo/modules/auth/auth_module.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserModel userModel = UserModel('name');
    log(userModel.name);
    return const Scaffold();
  }
}
