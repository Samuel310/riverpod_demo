import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/modules/zriverpod_state_demo/user_model.dart';
import 'package:riverpod_demo/modules/zriverpod_state_demo/user_repository.dart';

abstract class UserListState {
  const UserListState();
}

class UserListLoading extends UserListState {
  const UserListLoading();
}

class ErrorLoadingUserList extends UserListState {
  const ErrorLoadingUserList();
}

class UserListLoaded extends UserListState {
  final List<User> userList;
  const UserListLoaded(this.userList);
}

class UserListProvider extends StateNotifier<UserListState> {
  late UserRepository repository;
  UserListProvider(this.repository) : super(const UserListLoaded([]));

  void somefun(UserListState s) {}

  void loadUserData() async {
    try {
      state = const UserListLoading();
      List<User> userList = await repository.getUsers();
      state = UserListLoaded(userList);
    } catch (e) {
      log('Error while loading user data : ${e.toString()}');
      state = const ErrorLoadingUserList();
    }
  }

  void removeFromList(int index) {
    if (state is UserListLoaded) {
      List<User> userList = (state as UserListLoaded).userList;
      userList.removeAt(index);
      state = UserListLoaded(userList);
    }
  }
}

final Provider<UserRepository> userRepositoryProvider = Provider<UserRepository>(
  (ref) => FakeUserRepository(),
);
final StateNotifierProvider<UserListProvider, UserListState> userListProvider = StateNotifierProvider<UserListProvider, UserListState>((ref) => UserListProvider(ref.watch(userRepositoryProvider)));
