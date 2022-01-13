import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:github_repos_app/home/actions/loading_action.dart';
import 'package:github_repos_app/model/app_state.dart';
import 'package:github_repos_app/service/remote/github_remote_service.dart';

///
/// load_open_issues_action.dart
/// ...
///

class LoadOpenIssuesAction extends ReduxAction<AppState> {
  final String url;

  LoadOpenIssuesAction({required this.url});

  // todo fault tolerance
  @override
  Future<AppState?> reduce() {
    dispatch(LoadingAction(true));
    return GithubRemoteService.instance.getIssuesByUrl(url).then(
      (issues) {
        dispatch(LoadingAction(false));
        return state.copy(
          openIssues: issues.where((e) => e.state == "open").toList(),
        );
      },
    );
  }
}
