import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:github_repos_app/open_issues/actions/open_issues_navigation_action.dart';

import '../model/app_state.dart';
import 'actions/search_for_repos_action.dart';
import 'home_page.dart';
import 'home_page_vm.dart';
import 'model/home_page_model.dart';

///
/// home_page_connector.dart
/// ...
///

class HomePageConnector extends StatelessWidget {
  const HomePageConnector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Github",
          style: Theme.of(context).textTheme.headline3,
        ),
      ),
      body: StoreConnector<AppState, HomePageVm>(
        vm: () => _Factory(this),
        builder: (BuildContext context, HomePageVm vm) => HomePage(
          model: vm.model,
          searchForReposCallback: vm.searchForReposCallback,
          openRepoDetailCallback: vm.openRepoDetailCallback,
          changePageCallback: vm.changePageCallback,
        ),
      ),
    );
  }
}

class _Factory extends VmFactory<AppState, HomePageConnector> {
  _Factory(HomePageConnector connector) : super(connector);

  @override
  Vm? fromStore() => HomePageVm(
        model: HomePageModel.fromState(state),
        openRepoDetailCallback: (url) {
          dispatch(OpenIssuesNavigationAction(openIssuesUrl: url));
        },
        searchForReposCallback: (text) => dispatchAsync(
          SearchForReposAction(text: text, page: state.page),
        ),
        changePageCallback: (text, page) => dispatchAsync(
          SearchForReposAction(text: text, page: page),
        ),
      );
}
