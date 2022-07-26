// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mockito/annotations.dart';
import 'package:riverpod_demo/modules/zriverpod_state_demo/user_repository.dart';

Widget generateTestableWidget(List<Override> providerOverrides, Widget child) {
  return ProviderScope(
    overrides: providerOverrides,
    child: MaterialApp(
      title: 'Riverpod Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: child,
    ),
  );
}

@GenerateMocks([FakeUserRepository])
void main() {
  // late MockFakeUserRepository fakeUserRepository;

  // setUpAll(() {
  //   fakeUserRepository = MockFakeUserRepository();
  // });

  // testWidgets('Counter increments smoke test', (WidgetTester tester) async {
  //   when(fakeUserRepository.getUsers()).thenAnswer((realInvocation) async {
  //     return Future.error('error occured');
  //   });
  //   await tester.pumpWidget(
  //     generateTestableWidget(
  //       [userRepositoryProvider.overrideWithValue(fakeUserRepository)],
  //       const Homepage(),
  //     ),
  //   );
  //   Finder fabButton = find.byType(FloatingActionButton);
  //   expect(fabButton, findsOneWidget);
  // });
}
