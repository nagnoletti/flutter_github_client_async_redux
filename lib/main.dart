import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:github_repos_app/home/home_page_connector.dart';

import 'model/app_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static final _store = Store<AppState>(initialState: AppState.initial());

  @override
  Widget build(BuildContext context) {
    final navigatorKey = GlobalKey<NavigatorState>();
    NavigateAction.setNavigatorKey(navigatorKey);
    return StoreProvider(
      store: _store,
      child: MaterialApp(
        title: "Github repos",
        theme: ThemeData(
          primarySwatch: Colors.lime,
        ),
        initialRoute: "/",
        navigatorKey: navigatorKey,
        routes: {
          "/": (_) => const HomePageConnector(),
        },
      ),
    );
  }
}
