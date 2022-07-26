import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'modules/zriverpod_state_demo/manage_user_provider.dart';
import 'modules/zriverpod_state_demo/user_list_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Riverpod Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Homepage(),
      ),
    );
  }
}

class Homepage extends ConsumerWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    UserListState userListState = ref.watch(userListProvider);

    ref.listen<ManageUserState>(manageUserProvider, (previous, next) {
      if (next is UserDeletedState) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('User deleted.')));
      }
    });

    ref.listen<UserListState>(userListProvider, (previous, next) {
      if (next is ErrorLoadingUserList) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Error while loading user list.')));
      }
    });

    return Scaffold(
      appBar: AppBar(),
      body: (userListState is UserListLoaded)
          ? ListView.builder(
              itemCount: userListState.userList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(userListState.userList[index].name),
                  subtitle: Text(userListState.userList[index].email),
                  leading: IconButton(
                    onPressed: () {
                      ref.read(manageUserProvider.notifier).deleteUser(index);
                    },
                    icon: const Icon(Icons.delete),
                  ),
                );
              },
            )
          : const CircularProgressIndicator(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(userListProvider.notifier).loadUserData();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
