import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/modules/zriverpod_state_demo/user_list_provider.dart';

abstract class ManageUserState {
  const ManageUserState();
}

class InitialUserState extends ManageUserState {
  const InitialUserState();
}

class UserDeletedState extends ManageUserState {
  const UserDeletedState();
}

class ManageUserProvider extends StateNotifier<ManageUserState> {
  UserListProvider userListProvider;
  ManageUserProvider(this.userListProvider) : super(const InitialUserState());

  void deleteUser(int index) {
    state = const InitialUserState();
    userListProvider.removeFromList(index);
    state = const UserDeletedState();
  }
}

final StateNotifierProvider<ManageUserProvider, ManageUserState> manageUserProvider = StateNotifierProvider<ManageUserProvider, ManageUserState>((ref) {
  return ManageUserProvider(ref.read(userListProvider.notifier));
});
