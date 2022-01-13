import 'package:async_redux/async_redux.dart';
import 'package:github_repos_app/model/app_state.dart';
import 'package:github_repos_app/open_issues/actions/load_open_issues_action.dart';
import 'package:github_repos_app/open_issues/open_issues_connector.dart';
import 'package:github_repos_app/utils/slide_left_route_builder.dart';

///
/// open_issues_navigation_action.dart
/// ...
///

class OpenIssuesNavigationAction extends ReduxAction<AppState> {

  final String openIssuesUrl;

  OpenIssuesNavigationAction({required this.openIssuesUrl});

  @override
  AppState? reduce() {
    dispatchAsync(LoadOpenIssuesAction(url: openIssuesUrl));
    dispatch(
      NavigateAction.push(
        SlideLeftPageRouteBuilder(
          OpenIssuesConnector(
            openIssuesUrl: openIssuesUrl,
          ),
        ),
      ),
    );
    return null;
  }
}
