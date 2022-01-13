import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:github_repos_app/model/app_state.dart';
import 'package:github_repos_app/open_issues/actions/close_issues_navigation_action.dart';
import 'package:github_repos_app/open_issues/model/open_issues_page_model.dart';
import 'package:github_repos_app/open_issues/open_issues_page.dart';
import 'package:github_repos_app/open_issues/open_issues_vm.dart';

///
/// open_issues_connector.dart
/// ...
///

class OpenIssuesConnector extends StatelessWidget {
  final String openIssuesUrl;

  const OpenIssuesConnector({
    Key? key,
    required this.openIssuesUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: StoreConnector<AppState, OpenIssuesVm>(
          vm: () => _Factory(this),
          builder: (BuildContext context, OpenIssuesVm vm) => GestureDetector(
            onTap: () => vm.closeCallback(),
            child: const Padding(
              padding: EdgeInsets.all(8),
              child: Icon(Icons.close),
            ),
          ),
        ),
        title: Text(
          openIssuesUrl,
          overflow: TextOverflow.ellipsis,
          softWrap: false,
          maxLines: 1,
          style: Theme.of(context).textTheme.subtitle2?.copyWith(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                fontFamily: "monospace",
              ),
        ),
      ),
      body: StoreConnector<AppState, OpenIssuesVm>(
        vm: () => _Factory(this),
        builder: (BuildContext context, OpenIssuesVm vm) => OpenIssuesPage(
          model: vm.model,
          url: openIssuesUrl,
          closeCallback: vm.closeCallback,
        ),
      ),
    );
  }
}

class _Factory extends VmFactory<AppState, OpenIssuesConnector> {
  _Factory(OpenIssuesConnector connector) : super(connector);

  @override
  Vm? fromStore() => OpenIssuesVm(
        model: OpenIssuesPageModel.fromState(state),
        closeCallback: () => dispatch(
          CloseIssuesNavigationAction(),
        ),
      );
}
