import 'dart:math' as math;

import 'package:riverpod_demo/modules/zriverpod_state_demo/user_model.dart';

abstract class UserRepository {
  Future<List<User>> getUsers();
}

class FakeUserRepository implements UserRepository {
  @override
  Future<List<User>> getUsers() async {
    await Future.delayed(const Duration(seconds: 5));
    math.Random random = math.Random();
    List<User> userList = [];
    for (int i = 0; i < 10; i++) {
      String username = random.nextInt(100).toString();
      userList.add(User(name: username, email: '$username@gmail.com'));
    }
    return userList;
  }
}
