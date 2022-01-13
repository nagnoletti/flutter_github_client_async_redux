
import 'package:async_redux/async_redux.dart';
import 'package:github_repos_app/model/app_state.dart';

///
/// close_issues_navigation_action.dart
/// ...
///

class CloseIssuesNavigationAction extends ReduxAction<AppState> {
  @override
  AppState? reduce() {
    dispatch(NavigateAction.pop());
  }
}
